clear all
[data] = textread('data.txt');
n = 25;
X0 = rand(n-1, 2);
[x,f,e,out] = fminunc(@atomposition, X0, [], data(:,1), data(:,2), data(:,3));