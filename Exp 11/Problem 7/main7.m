clear all
X = 1850:2150; %��nȡ�ܶ಻ͬ��ֵ
mu = 2000; sigma = 50; %��̬�ֲ��ľ�ֵ��׼��
A = 0.5; b = 0.5; c = 0.35; K = 50000; %���ò�ͬ�Ĳ���ȡֵ
left = normcdf(X, mu, sigma);
delta = 2*X*A/K;
right = (delta+b-A) ./ (0*delta+b-c);
plot(X,left,'LineWidth',1.5)
hold on
plot(X, right,'LineWidth',1.5)
xlim([1850, 2150])
grid on; box on
title('�������߷��ⳬԽ����')
xlabel('n')
ylabel('value')
legend('left formula', 'right formula','Location','NorthWest')
saveas(gcf, 'equation.png')
