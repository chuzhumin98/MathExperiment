clear all
data = textread('data5.txt');
y = data(:,2);
n = length(y);
X1 = [ones(n,1), data(:,3:4)];
X2 = [ones(n,1), data(:,3), data(:,5)];
X3 = [ones(n,1), data(:,4:5)];
[b1, bint1, r1, rint1, s1] = regress(y, X1);
[b2, bint2, r2, rint2, s2] = regress(y, X2);
[b3, bint3, r3, rint3, s3] = regress(y, X3);
X4 = [ones(n,1), data(:,3:5)];
[b4, bint4, r4, rint4, s4] = regress(y, X4);
rcoplot(r1, rint1)
saveas(gcf, 'rco1.png')

figure
y5 = [y(1:7,1); y(9:19,1)]; %剔除异常点
X5 = [data(1:7,3:4); data(9:19,3:4)];
X5 = [ones(18,1), X5]; %剔除异常点
[b5, bint5, r5, rint5, s5] = regress(y5, X5);
rcoplot(r5, rint5)
saveas(gcf, 'rco2.png')

% figure
% scatter(y, data(:,3), 80, 'b.')
% xlabel('x_1')
% ylabel('y')
% title('x_1 vs y')
% saveas(gcf, 'x_1 vs y.png')
% 
% figure
% scatter(y, data(:,4), 80, 'b.')
% xlabel('x_2')
% ylabel('y')
% title('x_2 vs y')
% saveas(gcf, 'x_2 vs y.png')
% 
% figure
% scatter(y, data(:,5), 80, 'b.')
% xlabel('x_3')
% ylabel('y')
% title('x_3 vs y')
% saveas(gcf, 'x_3 vs y.png')