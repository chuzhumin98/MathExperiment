%% X=[a, alpha, beta],其他和题目中的名称一致，这个版本中展现的是非线性最小二乘拟合

function f = productv1(X, K, L, Q)
    for i = 1:length(K)
        f(i) = X(1) * K(i)^X(2) * L(i)^X(3) - Q(i);
    end
end