clear all
%% 设置微分方程中参数的值，并通过Runge-Kutta法求解
v1=2;
v2=2;
d=100;
x0 = [0 0];
ts=0:0.2:200;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@boat,ts,x0,opt1,v1,v2,d);
%% 绘制x-y图像
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('x(m)')
ylabel('y(m)')
ylim([0 100])
title(strcat('v_1=',num2str(v1),'时x-y的航线曲线图'))
saveas(gcf, strcat('v1=',num2str(v1),'时x-y的航线曲线图.png'))
%% 绘制y-t图，从而得到渡河所需时间
figure
plot(t(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('t(s)')
ylabel('y(m)')
ylim([0 100])
title(strcat('v_1=',num2str(v1),'时y-t的变化曲线'))
saveas(gcf, strcat('v1=',num2str(v1),'时y-t的变化曲线.png'))