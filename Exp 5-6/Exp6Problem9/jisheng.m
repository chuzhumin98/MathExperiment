%% ����-����ģ�͵ĺ�����X(1)-x,X(2)-y�����������뺬����һ��

function f = jisheng(X, a, b, r, N)
    f(1) = r * (1 - X(1)/N) * X(1) - a * X(1) * X(2);
    f(2) = X(2) * (b*X(1)-1);
end