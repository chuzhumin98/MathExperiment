clear all
mu = [0, 0]; %均值向量
Sigma = [0.64,0.16;0.16,0.25]; %协方差矩阵
sampleSize = 100000; %模拟的随机点的个数
thershold = 1; %有效区域的边界阈值
samples = mvnrnd(mu,Sigma,sampleSize); %按照分布选取随机点
scatter(samples(:,1), samples(:,2),'.')
hold on
theta = (1:10000)* pi / 5000;
edges = [cos(theta); sin(theta)]';
scatter(edges(:,1), edges(:,2),'.')
xlim([-4,4])
ylim([-3,3])
xlabel('x')
ylabel('y')
title('采样点分布')
legend('样本点','有效区域边界','Location','NorthWest')
box on; grid on
saveas(gcf, 'distribution.png')