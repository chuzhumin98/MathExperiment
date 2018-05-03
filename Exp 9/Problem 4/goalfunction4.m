%% 目标函数的定义
%    后五个函数参数是A,B,甲，乙，丙的价格
%    第一个参数x=[x_1, y_1, z_A, z_B, w_A, w_B]

function f = goalfunction4(x)
    priceA = 9; priceB = 15;
    priceJia = 6; priceYi = 16; priceBing = 10;
    f = priceJia * x(1) + priceYi * x(2) + priceBing * (x(3) + x(4)) - priceA * x(5) - priceB * x(6);
end