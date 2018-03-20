clear all
%% ����΢�ַ����в�����ֵ����ͨ��Runge-Kutta�����
g = 9.8/0.3048;
G = 527.436;
F = 470.327;
k = 0.08;
x0 = [0 0];
ts=0:0.1:15;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@sink,ts,x0,opt1,g,F,G,k);
%% ����˫������ͼ�񣬻���h-t,v-tͼ
[AX,H1,H2] = plotyy(t, x(:,1),t,x(:,2),'plot');
set(AX(1),'XColor','k','YColor','k');
set(AX(2),'XColor','k','YColor','k');
HH1=get(AX(1),'Ylabel');
set(HH1,'String','����߶�h(ft)');
set(HH1,'color','k');
HH2=get(AX(2),'Ylabel');
set(HH2,'String','�����ٶ�v(ft/s)');
set(HH2,'color','k');
set(H1,'LineStyle','-','LineWidth',2,'MarkerSize',20);
set(H1,'color','b');
set(H2,'LineStyle','-.');
set(H2,'color','r','LineWidth',2,'MarkerSize',20);
set(AX(1),'yTick',[0:100:400])  %�������Y��Ŀ̶� 
set(AX(2),'yTick',[0:10:60]) %�����ұ�Y��Ŀ̶�
set(AX(1),'ylim',[0 400])  %�������Y��Ŀ̶� 
set(AX(2),'ylim',[0 60]) %�����ұ�Y��Ŀ̶�
legend('����߶�','�ٶ�','location','northwest');
xlabel('ʱ��t(s)');
title('����߶Ⱥ��ٶ���ʱ��仯�����');
grid on
box on
saveas(gcf,'h-t,v-t��ϵͼ.png')
%% ����v-hͼ��
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('����߶�h(ft)')
ylabel('�����ٶ�v(ft/s)')
title('�����ٶ���߶ȵı仯��ϵ')
saveas(gcf, 'v-h��ϵͼ.png')