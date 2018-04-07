clear all
format bank %输出保留两位有效数字
%% 初始化模型中的参数
n = 5;
bi = [0, 0, 5, 3, 0]; %将各b_i存成向量，下同
si = [0.4, 0.6, 0.6, 0.4];
hi = [500, 400, 200, 100, 100];
A = -eye(n); %方程中的矩阵A
A(1,:) = A(1,:) + bi; %设置第一行的值
A(2:n,1:n-1) = A(2:n,1:n-1) + diag(si); %设置下次对角线
b = [0; hi(1:n-1)'];
%% 采用直接法求解方程组
x1 = A\b;
%% 尝试采用Jacobi迭代法求解
epsilon = 1e-6; %设置迭代法收敛的阈值
D = diag(diag(A)); %对角阵
U = triu(A, 1); %去对角上三角块
L = tril(A, -1); %去对角下三角块
B1 = D^(-1)*(L+U);
f1 = D^(-1)*b;
rou1 = max(abs(eig(B1)));
if (rou1 < 1) %收敛时则考虑使用Jacobi迭代法
    
end
%% 尝试采用Guass-Seideil迭代法求解
B2 = (D-L)^(-1)*U;
f2 = (D-L)^(-1)*b;
rou2 = max(abs(eig(B2)));
if (rou2 < 1) %收敛时则考虑使用Jacobi迭代法
    
end