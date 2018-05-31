clear all
data = textread('DATA.txt');
n1 = 10000;
alpha = 0.05; %显著性水平
z = norminv(1-alpha/2); %公式中的z
%% 举个简单的例子来验证近似的合理性
num = (n1 - 1) * data(1, 3)^2 - data(1, 5)^2;
den = (data(1,2) - data(1,4))^2 * n1 / z / z - data(1,3)^2;
n2 = num / den; 
n2s = linspace(31, 32, 10001);
leftnum = abs(data(1,2) - data(1,4));
leftden1 = sqrt(1/n1 + 1 ./ n2s);
leftden2 = sqrt(((n1-1)*data(1,3)^2 + (n2s - 1)*data(1,5)^2) ./ (n1+n2s-2));
lefts = leftnum ./ leftden1 ./ leftden2;
rights = tinv(1-alpha/2, n1+n2s-2);
plot(n2s, lefts,'LineWidth',1.5)
hold on
plot(n2s, rights,'LineWidth', 1.5)
xlabel('n_2')
ylabel('equation value')
legend('left value', 'right value', 'Location', 'NorthWest')
grid on; box on
title('n_2 vs equation value')
saveas(gcf, 'n_2 vs value.png')
%% 临界值的计算
numsmale = (n1 - 1) * data(:, 3) .^ 2 - data(:, 5) .^ 2;
densmale = (data(:,2) - data(:,4)) .^ 2 * n1 / z / z - data(:,3) .^ 2;
n2smale = numsmale ./ densmale; 
numsfemale = (n1 - 1) * data(:, 7) .^ 2 - data(:, 9) .^ 2;
densfemale = (data(:,6) - data(:,8)) .^ 2 * n1 / z / z - data(:,7) .^ 2;
n2sfemale = numsfemale ./ densfemale; 