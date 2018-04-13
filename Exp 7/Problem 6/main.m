clear all
[data] = textread('data.txt');
t = 10*(data(:,1)-1);
X0 = [0.5; 1.5; -1; 0.01; 0.02]; %设置迭代的初始值
y = data(:,2);
[X1, norm1, res, ef, out] = lsqnonlin(@nonlinearregression, X0, [], [], optimset('Algorithm','Levenberg-Marquardt','TolFun',1e-6,'MaxIter',1000), t, y);
[X2, norm2, iter] = guassnewtonv2(t, y, X0, 1e-6, 1000);
%% 进行扰动，在观察结果的变化
y1 = y - 0.05 + 0.10*rand(length(y),1);
[X1_1, norm1_1, res_1, ef_1, out_1] = lsqnonlin(@nonlinearregression, X0, [], [], optimset('Algorithm','Levenberg-Marquardt','TolFun',1e-6,'MaxIter',1000), t, y1);
[X2_1, norm2_1, iter_1] = guassnewtonv2(t, y1, X0, 1e-6, 1000);