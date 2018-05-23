clear all
mu = [0, 0]; %��ֵ����
Sigma = [0.64,0.16;0.16,0.25]; %Э�������
sampleSize = 100000; %ģ��������ĸ���
thershold = 1; %��Ч����ı߽���ֵ
Probs = []; %��¼��εĸ���
for k=1:50
    samples = mvnrnd(mu,Sigma,sampleSize); %���շֲ�ѡȡ�����
    usedSampleSize = 0; %����Ч���ڵ���������
    %% ������Ч�������������
    for i=1:sampleSize
        if samples(i,:)*samples(i,:)'<= 1
            usedSampleSize = usedSampleSize + 1;
        end
    end
    P = usedSampleSize / sampleSize; %����������Ч����Ƶ�ʣ����Ƹ���
    Probs = [Probs, P];
end
alpha = 0.05; %������
mu = mean(Probs)
sigma = std(Probs)
low = mu + norminv(alpha,0,1)*sigma
high = mu - norminv(alpha,0,1)*sigma