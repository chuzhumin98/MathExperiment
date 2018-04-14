%% ���ù�ʽbeta = (XX^T)^(-1)XY^T��Ԫ���Իع飬�����м������������������

function [beta, F, Falpha, CI] = productv2(Y, X, alpha)
    %% �������Ԫ���Իع�Ĳ�������
    N = length(Y); %���ݵ�ĸ���
    n = length(X(1,:)); %������ά��
    beta = zeros(n+1, 1); %��ʼ������������������ǰ��
    Xused = [ones(1,N);X']; %������Ա�������
    A = Xused * Xused'; %XX^T
    eig(A)
    B = Xused * Y;
    beta = A^(-1) * B; %��ò�������
    %% ����F-����
    Ybar = mean(Y); %Y�ľ�ֵ
    Yhat = beta' * Xused; %���Ƶ��Ա�����ֵ
    ESS = (Yhat - Ybar) * (Yhat - Ybar)'; %����ƽ����
    RSS = (Yhat - Y') * (Yhat - Y')'; %ʣ��ƽ����
    F = (N - n - 1) * ESS / n / RSS; %�������Fֵ
    Falpha = finv(1-alpha, n, N-n-1);
    CI = []; %�������������ƶ�ֵ
    if (F > Falpha)
        sprintf('������%5.3f�����ľܾ�ԭ���裬��ΪX��Y֮���������Թ�ϵ', 1-alpha)
        %% ͨ��F-������������������
        S = sqrt(RSS/(N-n-1)); %��׼��
        z = norminv(1-alpha/2,0,1);
        CI(1) = -S*z; %�����������½�ı仯ֵ
        CI(2) = S*z;
    else
        sprintf('����û���㹻�����ľܾ�ԭ����')
    end
end