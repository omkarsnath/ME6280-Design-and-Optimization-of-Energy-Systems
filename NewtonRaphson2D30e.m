% 2 variable Fan-Duct problem for Newton Raphson
clear; clc;
a1 = 100; a2 = 9.5; a3 = 1.8;
b1 = 20; b2 = -4.8e-5; b3 = 2;
%Start iteration
i = 1;
P(i) = 250; Q(i) = 10;
err(i) = 100; %Initial fake value of error to start computation
tol = 1.e-9; %Tolerance
while((err>tol)) 
    X = [P(i);Q(i)];
    f1 = X(1) -a2*X(2)^a3 - a1;
    f2 = X(2) -b2*X(1)^b3 - b1;
    J = [1                 -a2*a3*X(2)^(a3-1)
         -b2*b3*X(1)^(b3-1)         1];
    F = [f1;f2];
    %Iteration Step
    X = X - J\F; %Another way of writing X -inv(J)*F
    P(i+1) = X(1); Q(i+1) = X(2);
    %Find error;
    e = ((P(i+1)-P(i))/(P(i)))^2 + ((Q(i+1)-Q(i))/(Q(i)))^2 %Relative err
    err(i) = e;
    i = i +1;
end
