%%  Gauss-Newton method  

function [x, F, k] = guassnewtonv2(t, y, x0, error, itermax)
    format short;   
    x = x0; 
    f = @(x1,x2,x3,x4,x5) x1 + x2 * exp(-x4*t) + x3 * exp(-x5*t) - y;   
    J = [];  %������ֵ������ʽ
    for i = 1:length(t)
        J = [J; 1, exp(-x(4)*t(i)), exp(-x(5)*t(i)), -x(2)*t(i)*exp(-x(4)*t(i)), -x(3)*t(i)*exp(-x(5)*t(i))];
    end       
    F=x(1) + x(2) * exp(-x(4)*t) + x(3) * exp(-x(5)*t) - y;  
    k=0;               %��������  
    while (sum((J'*F).^2))^(1/2)>error  %�ж�ͣ�����, �����൱�����ݶȵ�ģ  
        d=-inv(J'*J)*J'*F;          %��������  
        x=x+d;                      %�µĵ�����  
        J = []; %�µĵ�������ֵ������ʽ 
        for i = 1:length(t)
            J = [J; 1, exp(-x(4)*t(i)), exp(-x(5)*t(i)), -x(2)*t(i)*exp(-x(4)*t(i)), -x(3)*t(i)*exp(-x(5)*t(i))];
        end                            
        F=x(1) + x(2) * exp(-x(4)*t) + x(3) * exp(-x(5)*t) - y; 
        k=k+1;                      %����������1  
        if (k > itermax) break; end
    end  
    sigma=(sum((J'*F).^2))^(1/2);          
    F=(sum(F.^2))^(1/2);                 %��ʾ��������������ȡֵ��ͣ�����ʽֵ��Ŀ�꺯��ֵ  
end