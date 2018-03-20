%Creat the function for sink
%Let x(1)=h=u1, x(2)=h'=u2

function dx=sink(t,x,g,F,G,k)
dx=[0;1];
dx(1)=x(2);
dx(2)=g-F*g/G-k*g/G*x(2);