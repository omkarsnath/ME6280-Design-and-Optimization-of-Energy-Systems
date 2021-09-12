% Problem for successive substitution
clear; clc;
q = 900;
h = 9;
Tinf = 300;
ep = 0.6;
sig = 5.67e-8;
%Start iteration
i = 1;
T(i) = 360; %First guess
err(i) = 100; %Initial fake value of error to start computation
tol = 1.e-6; %Tolerance

while(err>tol)
    f = h*(T(i)-Tinf) + ep*sig*(T(i)^4-Tinf^4) - q;
    fp = h + 4*ep*sig*T(i)^3;
    T(i+1) = T(i)- f/fp;
    
    err(i) = (T(i+1)-T(i))^2;
    (T(i+1)-T(i))^2
    i = i +1;
end