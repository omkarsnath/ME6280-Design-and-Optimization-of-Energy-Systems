function F = equations_ht(x)
a=40; b=0.01; c=4.98e-5;
dx=0.1;
Ts=298;
Tinf=303;
d=5; e=0.016;
Sig=5.67e-8;
%x(1)=T x(2)=k x(3)=h

F(1) = x(3)-(d+e*(x(1)));
F(2) = x(2)-(a+b*x(1)+c*(x(1)^2));
F(3) = x(2)*((x(1)-Ts)/dx)-x(3)*(x(1)-Tinf)-Sig*((x(1)^4)-(Tinf^4));

end