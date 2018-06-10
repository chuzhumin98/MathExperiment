clear all
data = textread('data10.txt');
y = data(:,2); %因变量
n = length(y); %样本点个数
X1 = zeros(n, 6); %自变量
X1(:,1) = ones(n,1); %第一列为常数项
X1(:,2) = data(:,3); %x_1项
X1(:,3) = data(:,3) .* data(:,3); %x_1^2项
X1(:,4) = data(:,4); %x_2项
[b1, bint1, r1, rint1, s1] = regress(y, X1(:,1:4)); %采用最初的模型进行拟合
F_alpha = finv(0.95,3,n-4)
plot(data(:,3) .* data(:,4), r1, '+')
title('residual vs x_1*x_2')
saveas(gcf, '10-1.png')

X1(:,5) = data(:,3) .* data(:,4); %增加x_1*x_2项
[b2, bint2, r2, rint2, s2] = regress(y, X1(:,1:5)); %采用改进后的模型进行拟合

X1(:,6) = data(:,4) .* data(:,4); %增加x_2^2项
[b3, bint3, r3, rint3, s3] = regress(y, X1(:,1:6)); %采用改进后的模型进行拟合