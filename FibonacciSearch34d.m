%%Fibonacci Search example for Solar
clear; clc; close all;

%Input data for search
a = 0.5; b = 3.5; %Initial range of radii
funcmax = 8; %Maximum number of function evaluations
itermax = funcmax-1;%Because the last iteration is useless

%Specify the search function 
V = 4; %Volume of the cylinder
A = @(r) 2*pi*r.^2 + 2*V./r; %Area to be minimized

iter = 1;
%Start the Fibonacci search
I = b-a; %Initial interval. I varies with iteration.
N = funcmax+1; %Keeps track of the Fibonacci number to be used for intervals
for i = 1:itermax
    Fn = fibonacci(N); Fn1 = fibonacci(N-1);
    I = I*Fn1/Fn;  
    %Select the two points
    x1 = b - I;     x2 = a + I;
    
    %Do the two point test
    f1 = A(x1); f2 = A(x2);
    if(f1>f2)
        a = x1;
    else 
        b = x2;
    end
    N = N -1; %Number of remaining iterations
    
    %Print values after iteration
    prt = ['Iter = ',num2str(i),...
           ', a = ', num2str(a),...
           ', b = ', num2str(b),...
           ', err = ', num2str(b-a),...
           ];
    disp(prt);  
end
