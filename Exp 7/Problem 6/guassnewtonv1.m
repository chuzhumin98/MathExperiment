%%  Gauss-Newton method  

function [x, F, k] = guassnewtonv1(t, y, x0, error, itermax)
    format short;   
    x = x0;
    syms x1 x2 x3 x4 x5;  
    f = x1 + x2 * exp(-x4*t) + x3 * exp(-x5*t) - y;  
    v=[x1 x2 x3 x4 x5];  
    j=jacobian(f,v);   %��jacobian����ʽ    
    J=subs(j,v,x');     %������ֵ������ʽ  
    F=subs(f,v,x');  
    k=0;               %��������  
    while (sum((J'*F).^2))^(1/2)>error  %�ж�ͣ�����, �����൱�����ݶȵ�ģ  
        d=-inv(J'*J)*J'*F;          %��������  
        x=x+d;                      %�µĵ�����  
        J=subs(j,v,x');              %�µĵ�������ֵ������ʽ             
        F=subs(f,v,x');  
        k=k+1;                      %����������1  
        if (k > itermax) break; end
    end  
    sigma=(sum((J'*F).^2))^(1/2);          
    F=(sum(F.^2))^(1/2);                 %��ʾ��������������ȡֵ��ͣ�����ʽֵ��Ŀ�꺯��ֵ  
end