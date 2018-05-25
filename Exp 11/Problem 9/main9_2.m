clear all
l = 2; sigma = 0.2;
m = linspace(1.50, 3.00, 1501);
x = (m-l)/sigma;
left = normcdf(x);
right = m .* normpdf(x)/sigma;
delta = left - right;
plot(m, left, 'LineWidth', 1.5)
hold on
plot(m, right, 'LineWidth', 1.5)
xlabel('m')
ylabel('value')
title('曲线法求解方程')
box on; grid on
legend('左式','右式')
saveas(gcf, 'figure2.png')
figure
W_m = delta ./ left ./ left;
plot(m,W_m,'LineWidth',1.5)
hold on
plot(m,zeros(1,1501), '--','LineWidth', 1.0)
box on; grid on
xlabel('m')
xlim([2, 3])
ylabel('W^*(m)')
title('W^*(m) vs m')
saveas(gcf, 'figure3.png')