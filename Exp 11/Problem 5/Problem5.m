clear all
mu = [0, 0]; %均值向量
Sigma = [0.64,0.16;0.16,0.25]; %协方差矩阵
sampleSize = 100000; %模拟的随机点的个数
thershold = 1; %有效区域的边界阈值
Probs = []; %记录多次的概率
for k=1:50
    samples = mvnrnd(mu,Sigma,sampleSize); %按照分布选取随机点
    usedSampleSize = 0; %在有效区内的样本个数
    %% 计数有效区内样本点个数
    for i=1:sampleSize
        if samples(i,:)*samples(i,:)'<= 1
            usedSampleSize = usedSampleSize + 1;
        end
    end
    P = usedSampleSize / sampleSize; %样本进入有效区的频率，估计概率
    Probs = [Probs, P];
end
alpha = 0.05; %区间限
mu = mean(Probs)
sigma = std(Probs)
low = mu + norminv(alpha,0,1)*sigma
high = mu - norminv(alpha,0,1)*sigma