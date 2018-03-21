k = 1/2;
v1 = 1;
d = 100;
x = @(y) sinh(k*log(d ./(d-y))).*(d-y);
Y = 0:0.5:100;
X = x(Y);
plot(X, Y, 'LineWidth', 2)
grid on
box on
xlabel('x(m)')
ylabel('y(m)')
ylim([0 100])
title(strcat('v_1=',num2str(v1),'时解析求解下的航线曲线图'))
saveas(gcf, strcat('v1=',num2str(v1),'时解析求解下的航线曲线图.png'))