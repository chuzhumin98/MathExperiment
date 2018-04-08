%% 均相共沸混合函数
% 参数含义：XT = (x1,x2,...,x_(n-1),T);P为压强;
% a,b,c分别为各物质的参数向量;Q为交互作用矩阵

function f = gongfeihunhe(XT, a, b, c, P, Q)
    n = length(a);
    for i = 1:n-1
        x(i) = XT(i); %各组分含量
    end
    x(n) = 1 - sum(x(1:n-1)); %约束条件，组分和为1
    T = XT(n); %温度T
    den = x * Q'; %复杂求和式的分母
    k = x ./ den; %复杂求和式q前面的系数
    for i = 1:n
        f(i) = x(i)*(b(i)/(T+c(i)) + log(x*Q(i,:)') + k*Q(:,i) - 1 -a(i) + log(P)); 
    end
end