clear all
%% 第3题,考虑带阻尼的投资组合变化
data = textread('data.txt');
mu = mean(data);
mu = mu(2:4)-1; %取第2,3,4项为有用的均值项(需要去除本金1才作为收益)
V = cov(data(:,2:4)); %计算协方差矩阵
H = 2*V; %协方差矩阵的各个元素均需要乘2
c = [0,0,0];
A1 = -mu;
b1 = -0.15;
A2 = [1,1,0.99];
b2 = [0.9985];
v1 = [0.50,0.35,0.00];
v2 = [0.6485,0.3985,0.15];
x0 = [0.50,0.35,0.15];
[x,fv,ef,out,lag] = quadprog(H,c,A1,b1,A2,b2,v1,v2,x0);