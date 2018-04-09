clear all
format short
%% �����ĳ�ʼ��
a = 0.025; b = 0.02;
r = 1.5; N = 100;                                                                                   
X0 = [50, 10]; %�����ĳ�ʼֵ
%% ��ֵ������ⷽ����
[X Y] = fsolve(@jisheng, X0, [], a, b, r, N);
%% ������Ⱥ������ʱ��ı仯����
xt = X0(1); yt = X0(2); %���ó�ʼֵ
T = 5000; %���ñ仯����ʱ��
for k = 1:T
    xt = [xt, xt(k)+r*(1-xt(k)/N)*xt(k)-a*xt(k)*yt(k)];
    yt = [yt, b*xt(k)*yt(k)];
end
low = 4900; high = 5000;
plot(low:high, xt(low+1:high+1), 'b', 'LineWidth', 2)
hold on
plot(low:high, yt(low+1:high+1), 'r', 'LineWidth', 2)
grid on; box on;
xlabel('ʱ��t')
ylabel('��Ⱥ����')
title('�����ͼ�������Ⱥ������ʱ��ı仯����')
legend('������Ⱥ����','��������Ⱥ����','Location','NorthEast')
saveas(gcf, strcat(num2str(low),'-',num2str(high),'��Ⱥ������ʱ��ı仯����.png'))