%% X=[a, alpha, beta],��������Ŀ�е�����һ�£�����汾��չ�ֵ��Ƿ�������С�������

function f = productv1(X, K, L, Q)
    for i = 1:length(K)
        f(i) = X(1) * K(i)^X(2) * L(i)^X(3) - Q(i);
    end
end