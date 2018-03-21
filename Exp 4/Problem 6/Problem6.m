clear all
%% ����΢�ַ����в�����ֵ����ͨ��Runge-Kutta�����
v1=2;
v2=2;
d=100;
x0 = [0 0];
ts=0:0.2:200;
opt1=odeset('RelTol',1e-6,'AbsTol',1e-9);
[t, x] = ode45(@boat,ts,x0,opt1,v1,v2,d);
%% ����x-yͼ��
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('x(m)')
ylabel('y(m)')
ylim([0 100])
title(strcat('v_1=',num2str(v1),'ʱx-y�ĺ�������ͼ'))
saveas(gcf, strcat('v1=',num2str(v1),'ʱx-y�ĺ�������ͼ.png'))
%% ����y-tͼ���Ӷ��õ��ɺ�����ʱ��
figure
plot(t(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('t(s)')
ylabel('y(m)')
ylim([0 100])
title(strcat('v_1=',num2str(v1),'ʱy-t�ı仯����'))
saveas(gcf, strcat('v1=',num2str(v1),'ʱy-t�ı仯����.png'))