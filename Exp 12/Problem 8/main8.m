clear all
data = textread('DATA.txt');
delta = data(2,:) - data(1,:);
alpha = 0.05;
[h, sig, ci] = ttest(delta, 0, alpha, 0);