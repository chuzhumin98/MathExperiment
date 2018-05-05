clear all
%% 第0题,求解期望收益率不低于15%的情况
data = textread('data.txt');
mu = mean(data);
mu = mu(2:4)-1; %取第2,3,4项为有用的均值项(需要去除本金1才作为收益)
V = cov(data(:,2:4)); %计算协方差矩阵
H = 2*V; %协方差矩阵的各个元素均需要乘2
c = [0,0,0];
A1 = -mu;
b1 = -0.15;
A2 = [1,1,1];
b2 = [1];
v1 = [0,0,0];
v2 = [1,1,1];
x0 = [0,0,1];
[x,fv,ef,out,lag] = quadprog(H,c,A1,b1,A2,b2,v1,v2,x0);
%% 第1题,观察期望年收益率变化时的参数变化
b1s = 0.080:0.001:0.234; %选取多组不同的b1,即最低期望收益
xs = []; %记录与之对应的优化结果
fvs = []; %记录风险的变化
for i=1:length(b1s)
    [x1,fv1,ef1,out1,lag1] = quadprog(H,c,A1,-b1s(i),A2,b2,v1,v2,x0);
    xs = [xs, x1];
    fvs = [fvs, fv1];
end
plot(b1s, xs(1,:), 'r', 'LineWidth',2)
hold on
plot(b1s, xs(2,:), 'b', 'LineWidth',2)
plot(b1s, xs(3,:), 'g', 'LineWidth',2)
xlabel('期望年收益率')
ylabel('所占投资比例')
title('股票组合 vs 期望年收益率')
box on; grid on
legend('股票A','股票B','股票C','Location','NorthWest')
saveas(gcf, 'combine-rate.png')
figure
plot(b1s, fvs, 'b', 'LineWidth', 2)
xlabel('期望年收益率')
ylabel('投资风险')
title('投资风险 vs 期望年收益率')
box on; grid on
saveas(gcf, 'risk-rate.png')