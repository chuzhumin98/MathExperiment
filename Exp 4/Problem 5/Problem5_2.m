clear all
%% ������������h(t)��h'(t)
g = 9.8/0.3048;
G = 527.436;
F = 470.327;
k = 0.08;
h = @(t) (G-F)*G*(exp(-k*g*t/G)-1)/(k*k*g)+(G-F)*t/k; %����h(t)
v = @(t) (G-F)*(1-exp(-k*g*t/G))/k; %����h'(t)
%% ��ͼ�л���˫������ͼ��
X = 0:0.1:15;
Y1 = h(X);
Y2 = v(X);
[AX,H1,H2] = plotyy(X, Y1,X,Y2,'plot');
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
title('�����������߶Ⱥ��ٶ���ʱ��仯�����');
grid on
box on
saveas(gcf,'��ȷ�����h-t,v-t��ϵͼ.png')