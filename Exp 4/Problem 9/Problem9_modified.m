clear all
%% 设置微分方程中参数的值，并通过Runge-Kutta法求解
r1 = 1.4;
r2 = 0.9;
n1 = 150;
n2 = 100;
s1 = 1.5;
s2 = 0.7;
x0 = [15 20];
ts=0:0.1:15;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@jingzheng,ts,x0,opt1,r1,r2,n1,n2,s1,s2);
%% 绘制x(t),y(t)图
plot(t, x(:,1), 'b-', 'LineWidth', 2)
hold on
plot(t, x(:,2), 'r-.', 'LineWidth', 2)
xlabel('时间t')
ylabel('种群的数量')
title('甲乙种群的数量随时间的变化关系')
box on
grid on
legend('甲物种','乙物种','Location','NorthWest')
saveas(gcf,strcat('s1=',num2str(s1),',s2=',num2str(s2), '时甲乙种群数量随时间的变化关系.png'))
%% 绘制相图(x,y)
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('甲种群的数量')
ylabel('乙种群的数量')
title('甲乙种群的相图')
saveas(gcf, strcat('s1=',num2str(s1),',s2=',num2str(s2),'下甲乙种群的相图.png'))