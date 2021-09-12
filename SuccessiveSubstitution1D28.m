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
tol = 1.e-2; %Tolerance
while(err>tol) %Continue till the error is higher than the tolerance
    
    T(i+1) = (q-ep*sig*(T(i)^4-Tinf^4))/h+Tinf; %Method 1 converges
    
    %T(i+1) = ((q-h*(T(i)-Tinf))/(ep*sig)+Tinf^4)^(0.25); %Method 2
    %diverges
    err(i) = (T(i+1)-T(i))^2;
    (T(i+1)-T(i))^2
    i = i +1;
end
