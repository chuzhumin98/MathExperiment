clear all
%% ����΢�ַ����в�����ֵ����ͨ��Runge-Kutta�����
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
%% ����x(t),y(t)ͼ
plot(t, x(:,1), 'b-', 'LineWidth', 2)
hold on
plot(t, x(:,2), 'r-.', 'LineWidth', 2)
xlabel('ʱ��t')
ylabel('��Ⱥ������')
title('������Ⱥ��������ʱ��ı仯��ϵ')
box on
grid on
legend('������','������','Location','NorthWest')
saveas(gcf,strcat('s1=',num2str(s1),',s2=',num2str(s2), 'ʱ������Ⱥ������ʱ��ı仯��ϵ.png'))
%% ������ͼ(x,y)
figure
plot(x(:,1),x(:,2),'LineWidth',2)
grid on
box on
xlabel('����Ⱥ������')
ylabel('����Ⱥ������')
title('������Ⱥ����ͼ')
saveas(gcf, strcat('s1=',num2str(s1),',s2=',num2str(s2),'�¼�����Ⱥ����ͼ.png'))