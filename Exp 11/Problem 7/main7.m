clear all
X = 1850:2150; %将n取很多不同的值
mu = 2000; sigma = 50; %正态分布的均值标准差
A = 0.5; b = 0.5; c = 0.35; K = 50000; %设置不同的参数取值
left = normcdf(X, mu, sigma);
delta = 2*X*A/K;
right = (delta+b-A) ./ (0*delta+b-c);
plot(X,left,'LineWidth',1.5)
hold on
plot(X, right,'LineWidth',1.5)
xlim([1850, 2150])
grid on; box on
title('采用曲线法解超越方程')
xlabel('n')
ylabel('value')
legend('left formula', 'right formula','Location','NorthWest')
saveas(gcf, 'equation.png')
