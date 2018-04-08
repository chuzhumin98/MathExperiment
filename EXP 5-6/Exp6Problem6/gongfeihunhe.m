%% ���๲�л�Ϻ���
% �������壺XT = (x1,x2,...,x_(n-1),T);PΪѹǿ;
% a,b,c�ֱ�Ϊ�����ʵĲ�������;QΪ�������þ���

function f = gongfeihunhe(XT, a, b, c, P, Q)
    n = length(a);
    for i = 1:n-1
        x(i) = XT(i); %����ֺ���
    end
    x(n) = 1 - sum(x(1:n-1)); %Լ����������ֺ�Ϊ1
    T = XT(n); %�¶�T
    den = x * Q'; %�������ʽ�ķ�ĸ
    k = x ./ den; %�������ʽqǰ���ϵ��
    for i = 1:n
        f(i) = x(i)*(b(i)/(T+c(i)) + log(x*Q(i,:)') + k*Q(:,i) - 1 -a(i) + log(P)); 
    end
end