%% X=[x1,x2,x3,x4,x5],t��y���������еķ��ź���һ��

function f = nonlinearregression(X, t, y)
    f = X(1) + X(2) * exp(-X(4)*t) + X(3) * exp(-X(5)*t) - y;
end