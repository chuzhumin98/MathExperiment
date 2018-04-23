clear all
%% 进行参数的初始化
c = -[0.8, 5, 5.5];
A1 = [30, 20, 50; 3, 0, 5; 0.02, 0.1, 0.2; 0.01, 0.05, 0.05];
b1 = [1500, 200, 3, 1];
v1 = [0, 0, 0];
%% 进行线性规划
[x, f, exitflag, output, lag] = linprog(c, A1, b1, [], [], v1);