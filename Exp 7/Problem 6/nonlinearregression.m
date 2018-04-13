%% X=[x1,x2,x3,x4,x5],t和y向量与题中的符号含义一致

function f = nonlinearregression(X, t, y)
    f = X(1) + X(2) * exp(-X(4)*t) + X(3) * exp(-X(5)*t) - y;
end