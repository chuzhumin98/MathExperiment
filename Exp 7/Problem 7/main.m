clear all
[data] = textread('data.txt');
X0 = rand(3,1);
[X, norm, res, ef, out] = lsqnonlin(@productv1, X0, [], [], optimset('Display','off'), data(:,3), data(:,4), data(:,2));
[beta, F, Falpha, CI] = productv3(log(data(:,2)), log(data(:,3:4)), 0.05);
% [beta, F, Falpha, CI] = productv3(log(data(:,2)), log(data(:,3:4)), 0.05);