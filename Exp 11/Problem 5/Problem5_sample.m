clear all
mu = [0, 0]; %��ֵ����
Sigma = [0.64,0.16;0.16,0.25]; %Э�������
sampleSize = 100000; %ģ��������ĸ���
thershold = 1; %��Ч����ı߽���ֵ
samples = mvnrnd(mu,Sigma,sampleSize); %���շֲ�ѡȡ�����
scatter(samples(:,1), samples(:,2),'.')
hold on
theta = (1:10000)* pi / 5000;
edges = [cos(theta); sin(theta)]';
scatter(edges(:,1), edges(:,2),'.')
xlim([-4,4])
ylim([-3,3])
xlabel('x')
ylabel('y')
title('������ֲ�')
legend('������','��Ч����߽�','Location','NorthWest')
box on; grid on
saveas(gcf, 'distribution.png')