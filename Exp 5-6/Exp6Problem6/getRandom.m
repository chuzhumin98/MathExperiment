%% 按照维度为n的要求生成一组XT的随机数

function XT = getRandom(n)
    xinit = rand(1,n); %生成各组分的随机数
    x = xinit / sum(xinit); %将各组分之间进行归一化
    XT(1:n-1) = x(1:n-1);
    XT(n) = 50 + 250 * rand(); %温度取-50至200间的随机数
end