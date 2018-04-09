clear all
format short
%% 变量的初始化
a = 0.025; b = 0.02;
r = 1.5; N = 100;
X0 = [50, 10]; %迭代的初始值
%% 数值方法求解方程组
[X Y] = fsolve(@jisheng, X0, [], a, b, r, N);