clear all
format short
%% 变量的初始化
a = 0.025; b = 0.02;
r = 1.5; N = 100;                                                                                   
X0 = [50, 10]; %迭代的初始值
%% 数值方法求解方程组
[X Y] = fsolve(@jisheng, X0, [], a, b, r, N);
%% 绘制种群数量随时间的变化曲线
xt = X0(1); yt = X0(2); %设置初始值
T = 5000; %设置变化的总时长
for k = 1:T
    xt = [xt, xt(k)+r*(1-xt(k)/N)*xt(k)-a*xt(k)*yt(k)];
    yt = [yt, b*xt(k)*yt(k)];
end
low = 4900; high = 5000;
plot(low:high, xt(low+1:high+1), 'b', 'LineWidth', 2)
hold on
plot(low:high, yt(low+1:high+1), 'r', 'LineWidth', 2)
grid on; box on;
xlabel('时间t')
ylabel('种群数量')
title('寄主和寄生物种群数量随时间的变化趋势')
legend('寄主种群数量','寄生物种群数量','Location','NorthEast')
saveas(gcf, strcat(num2str(low),'-',num2str(high),'种群数量随时间的变化趋势.png'))