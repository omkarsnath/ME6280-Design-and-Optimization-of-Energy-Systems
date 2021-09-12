clear; clc; close all;
%Simultaneous, two-variable, golden section

a = 0.5; b = 1; % Lower and upper limits of radius
c = 1; d = 2; %Lower and upper limits of height
P = 1000; %Penalty parameter

f = @(x1,x2) 2*pi*x1^2 + 2*pi*x1*x2 + P*(pi*x1^2*x2-4)^2; %Penalty objective
itermax = 1000;
tau = 0.5*(sqrt(5)-1); %Golden ratio
for i = 1:itermax
    I = b-a; %Interval for r
    J = d-c; %Interval for h
    
    r1 = a + tau*I; h1 = c + tau*J; %First probe point
    r2 = b - tau*I; h2 = d - tau*J; %Second probe point
    
    r = 0.5*(r1+r2);
    h = 0.5*(h1+h2);
    
    %Apply two point rule on r
    f1 = f(r1,h); f2 = f(r2,h);
    if(f1>f2) 
        b = r1; r = r1;
    else
        a = r2; r = r2;
    end

    %Apply two point rule on h
    f1 = f(r,h1); f2 = f(r,h2);
    if(f1>f2) 
        d = h1; h = h1;
    else
        c = h2; h = h2;
    end
end
A = 2*pi*r^2 + 2*pi*r*h;
V = pi*r^2*h;
%Print values after iteration
prt = ['P = ', num2str(P), ...
           ', r = ', num2str(r),...
           ', h = ', num2str(h),...
           ', A = ', num2str(A),...
           ', V = ', num2str(V),...
           ];
disp(prt);