%Creat the function for boat
%Let x(1)=x, x(2)=y

function dx=boat(t,x,v1,v2,d)
den = sqrt(x(1)*x(1)+(d-x(2))*(d-x(2))); %·ÖÄ¸Ïî
dx=[0;1];
dx(1)=(den > 1)*(v1 - v2*x(1)/den);
dx(2)=(den > 1)*(v2*(d-x(2))/den);