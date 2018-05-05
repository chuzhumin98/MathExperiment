clear all
%% 第2题,增加了国库券后重新计算投资比例
data = textread('data.txt');
mu = mean(data);
mu = [mu(2:4)-1,0.05]; %取第2,3,4项为有用的均值项(需要去除本金1才作为收益),同时加上国库券
dataused = [data(:,2:4), 0.05*ones(length(data),1)]; %将国库券加入到矩阵之中
V = cov(dataused); %计算协方差矩阵
H = 2*V; %协方差矩阵的各个元素均需要乘2
c = [0,0,0,0];
A1 = -mu;
b1 = -0.15;
A2 = [1,1,1,1];
b2 = [1];
v1 = [0,0,0,0];
v2 = [1,1,1,1];
x0 = [0,0,1,0];
[x,fv,ef,out,lag] = quadprog(H,c,A1,b1,A2,b2,v1,v2,x0);