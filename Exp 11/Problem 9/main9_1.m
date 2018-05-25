clear all
n = 100000; %采样的点数
samples = normrnd(0,1,1,n);
samples = sort(samples, 'descend'); %将数据倒序排列
intvalue = zeros(1,n); %存储对应的数值积分值
intvalue(1) = samples(1);
for i=2:n
    intvalue(i) = intvalue(i-1)+samples(i);
end
intvalue = intvalue / n;
plot(samples, intvalue,'LineWidth',1.5)
hold on
splitNum = 0.2/2;
plot(samples, ones(1,n)*splitNum, 'LineWidth',1.5)
box on; grid on
xlabel('积分下限')
ylabel('积分值')
title('采用蒙特卡洛法求解此积分')
legend('积分值','常数值')
saveas(gcf, 'figure1.png')