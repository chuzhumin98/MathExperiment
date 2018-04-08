%% 运用迭代法的公式x(k+1) = Bx(k) + f进行迭代法求解,
%  模型输出：x-解向量，iter-收敛时迭代的次数,rou-谱半径
%  模型参数：B-B矩阵，f-f常值向量,maxiter-最大迭代轮数,epsilon-判停误差限

function [x, iter, rou] = Iterative(B, f, maxiter, epsilon)
    rou = max(abs(eig(B))); %计算谱半径
    size = length(B);
    xpred = rand(size,1); %随机生成初始的x向量
    x = xpred; %记录计算后结果
    iter = 0; %记录当前的迭代轮数
    if (rou >= 1) return; end
    while (true)
        x = B*xpred + f; %计算迭代后结果
        iter = iter + 1; %迭代轮数加一
        if (sum(abs(x - xpred)) <= epsilon) return; end %将1-范数作为判停条件
        if (iter > maxiter) return; end %达到迭代上界时也会返回
        xpred = x;
    end
end