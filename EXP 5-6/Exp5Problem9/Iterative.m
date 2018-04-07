%% ���õ������Ĺ�ʽx(k+1) = Bx(k) + f���е��������,
%  ģ�������x-��������iter-����ʱ�����Ĵ���,rou-�װ뾶
%  ģ�Ͳ�����B-B����f-f��ֵ����,maxiter-����������,epsilon-��ͣ�����

function [x, iter, rou] = Iterative(B, f, maxiter, epsilon)
    rou = max(abs(eig(B))); %�����װ뾶
    size = length(B);
    xpred = rand(size,1); %������ɳ�ʼ��x����
    x = xpred; %��¼�������
    iter = 0; %��¼��ǰ�ĵ�������
    if (rou >= 1) return; end
    while (true)
        x = B*xpred + f; %�����������
        iter = iter + 1; %����������һ
        if (sum(abs(x - xpred)) <= epsilon) return; end %��1-������Ϊ��ͣ����
        if (iter > maxiter) return; end %�ﵽ�����Ͻ�ʱҲ�᷵��
        xpred = x;
    end
end