%%  Gauss-Newton method  

function [x, F, k] = guassnewtonv1(t, y, x0, error, itermax)
    format short;   
    x = x0;
    syms x1 x2 x3 x4 x5;  
    f = x1 + x2 * exp(-x4*t) + x3 * exp(-x5*t) - y;  
    v=[x1 x2 x3 x4 x5];  
    j=jacobian(f,v);   %求jacobian行列式    
    J=subs(j,v,x');     %初点数值带入表达式  
    F=subs(f,v,x');  
    k=0;               %迭代次数  
    while (sum((J'*F).^2))^(1/2)>error  %判断停机与否, 这里相当于求梯度的模  
        d=-inv(J'*J)*J'*F;          %搜索方向  
        x=x+d;                      %新的迭代点  
        J=subs(j,v,x');              %新的迭代点数值带入表达式             
        F=subs(f,v,x');  
        k=k+1;                      %迭代次数加1  
        if (k > itermax) break; end
    end  
    sigma=(sum((J'*F).^2))^(1/2);          
    F=(sum(F.^2))^(1/2);                 %显示迭代次数，变量取值，停机表达式值，目标函数值  
end