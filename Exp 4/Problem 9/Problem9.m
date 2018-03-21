clear all
%% ����΢�ַ����в�����ֵ����ͨ��Runge-Kutta�����
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
%% ����x(t),y(t)ͼ
plot(t, x(:,1), 'b-', 'LineWidth', 2)
hold on
plot(t, x(:,2), 'r-.', 'LineWidth', 2)
xlabel('ʱ��t')
ylabel('��Ⱥ������')
title('ԭʼ�����¼�����Ⱥ��������ʱ��ı仯��ϵ')
box on
grid on
legend('������','������','Location','NorthWest')
saveas(gcf, 'ԭ�����¼�����Ⱥ������ʱ��ı仯��ϵ.png')
%% ������ͼ(x,y)
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('����Ⱥ������')
ylabel('����Ⱥ������')
title('ԭʼ�����¼�����Ⱥ����ͼ')
saveas(gcf, 'ԭʼ�����¼�����Ⱥ����ͼ.png')