clear all
%% 设置微分方程中参数的值，并通过Runge-Kutta法求解
r1 = 1;
r2 = 1;
n1 = 100;
n2 = 100;
s1 = 0.5;
s2 = 2;
x0 = [10 10];
ts=0:0.1:15;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@jingzheng,ts,x0,opt1,r1,r2,n1,n2,s1,s2);
%% 绘制x(t),y(t)图
plot(t, x(:,1), 'b-', 'LineWidth', 2)
hold on
plot(t, x(:,2), 'r-.', 'LineWidth', 2)
xlabel('时间t')
ylabel('种群的数量')
title('原始参数下甲乙种群的数量随时间的变化关系')
box on
grid on
legend('甲物种','乙物种','Location','NorthWest')
saveas(gcf, '原参数下甲乙种群数量随时间的变化关系.png')
%% 绘制相图(x,y)
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('甲种群的数量')
ylabel('乙种群的数量')
title('原始参数下甲乙种群的相图')
saveas(gcf, '原始参数下甲乙种群的相图.png')