%Creat the function for jingzheng
%Let x(1)=x, x(2)=y

function dx=jingzheng(t,x,r1,r2,n1,n2,s1,s2)
dx=[0;1];
dx(1) = r1*x(1)*(1-x(1)/n1-s1*x(2)/n2);
dx(2) = r2*x(2)*(1-s2*x(1)/n1-x(2)/n2);