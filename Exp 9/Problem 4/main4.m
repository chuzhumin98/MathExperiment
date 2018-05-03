clear all
%% 给非线性规划的参数赋值
A1 = [0,0,1,1,0,0;
    0,0,1,0,-1,0;
    0,0,0,1,0,-1];
b1 = [500;0;0];
A2 = [1,1,1,1,-1,-1];
b2 = [0];
v1 = [0,0,0,0,0,0];
v2 = [500,500,500,500,100,200];
x0 = [0,1,0,0,0,1]; %设定初始值
opt1 = optimset('largescale','off','MaxIter',3000,'MaxFun',20000); %设置优化选项
[x1, fv1, ef1, out1, lag1, grad1, hess1] = fmincon(@goalfunction4,x0,A1,b1,A2,b2,v1,v2,@cfunction4,opt1);