clear all
[data] = textread('data.txt');
n = 25;
X0 = 2*rand(n-1, 2)-1;
opt = optimset('fminunc');
opt = optimset(opt, 'tolf',1e-4,'maxiter',1e5);
[x,f,e,out] = fminunc(@atomposition, X0, opt, data(:,1), data(:,2), data(:,3));
% [x1,norm,res] = lsqnonlin(@atomposition, X0, [], [], opt, data(:,1), data(:,2), data(:,3));