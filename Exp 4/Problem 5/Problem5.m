clear all
%% 设置微分方程中参数的值，并通过Runge-Kutta法求解
g = 9.8/0.3048;
G = 527.436;
F = 470.327;
k = 0.08;
x0 = [0 0];
ts=0:0.1:15;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@sink,ts,x0,opt1,g,F,G,k);
%% 设置双纵坐标图像，绘制h-t,v-t图
[AX,H1,H2] = plotyy(t, x(:,1),t,x(:,2),'plot');
set(AX(1),'XColor','k','YColor','k');
set(AX(2),'XColor','k','YColor','k');
HH1=get(AX(1),'Ylabel');
set(HH1,'String','下落高度h(ft)');
set(HH1,'color','k');
HH2=get(AX(2),'Ylabel');
set(HH2,'String','下落速度v(ft/s)');
set(HH2,'color','k');
set(H1,'LineStyle','-','LineWidth',2,'MarkerSize',20);
set(H1,'color','b');
set(H2,'LineStyle','-.');
set(H2,'color','r','LineWidth',2,'MarkerSize',20);
set(AX(1),'yTick',[0:100:400])  %设置左边Y轴的刻度 
set(AX(2),'yTick',[0:10:60]) %设置右边Y轴的刻度
set(AX(1),'ylim',[0 400])  %设置左边Y轴的刻度 
set(AX(2),'ylim',[0 60]) %设置右边Y轴的刻度
legend('下落高度','速度','location','northwest');
xlabel('时间t(s)');
title('下落高度和速度随时间变化的情况');
grid on
box on
saveas(gcf,'h-t,v-t关系图.png')
%% 绘制v-h图像
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('下落高度h(ft)')
ylabel('下落速度v(ft/s)')
title('下落速度随高度的变化关系')
saveas(gcf, 'v-h关系图.png')