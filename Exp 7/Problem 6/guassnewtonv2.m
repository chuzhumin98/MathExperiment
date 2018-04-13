%%  Gauss-Newton method  
function [x, norm, k] = guassnewtonv2(t, y, x0, error, itermax)
    format short;   
    x = x0;  
    J = [];  %初点数值带入表达式
    for i = 1:length(t)
        J = [J; 1, exp(-x(4)*t(i)), exp(-x(5)*t(i)), -x(2)*t(i)*exp(-x(4)*t(i)), -x(3)*t(i)*exp(-x(5)*t(i))];
    end       
    F = x(1) + x(2) * exp(-x(4)*t) + x(3) * exp(-x(5)*t) - y;  
    k = 0;               %迭代次数  
    while (sum((J'*F).^2))^(1/2) > error  %判断停机与否, 这里相当于求梯度的模  
        d = -inv(J'*J) * J' * F;          %搜索方向  
        x = x + d;                      %新的迭代点  
        J = []; %新的迭代点数值带入表达式 
        for i = 1:length(t)
            J = [J; 1, exp(-x(4)*t(i)), exp(-x(5)*t(i)), -x(2)*t(i)*exp(-x(4)*t(i)), -x(3)*t(i)*exp(-x(5)*t(i))];
        end                            
        F=x(1) + x(2) * exp(-x(4)*t) + x(3) * exp(-x(5)*t) - y; 
        k = k + 1;                      %迭代次数加1  
        if (k > itermax) break; end %设置迭代上限
    end  
    sigma = (sum((J'*F).^2))^(1/2);          
    norm = (sum(F.^2));                 %目标函数值  
end