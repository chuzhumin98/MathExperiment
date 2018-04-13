clear all
[data] = textread('data.txt');
t = 10*(data(:,1)-1);
X0 = [0.5; 1.5; -1; 0.01; 0.02]; %设置迭代的初始值
y = data(:,2);
[X1, norm, res, ef, out] = lsqnonlin(@nonlinearregression, X0, [], [], optimset('Algorithm','Levenberg-Marquardt'), t, y);
[X2, F, iter] = guassnewtonv2(t, y, X0, 1e-2, 1000);