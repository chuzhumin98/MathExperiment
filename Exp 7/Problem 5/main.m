clear all
[data] = textread('data.txt');
n = 25;
opt = optimset('fminunc');
opt = optimset(opt, 'maxiter',1e4);
fmin = 1.0000;
for i = 1:100
    X0 = 2*rand(n-1, 2)-1;
    [x,f,e,out] = fminunc(@atomposition, X0, opt, data(:,1), data(:,2), data(:,3));
    if (fmin > f)
        fmin = f;
        Xmin = x;
    end
end
        