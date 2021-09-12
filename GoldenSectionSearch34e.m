%%Golden Section Search example for Solar
clear; clc; close all;

%Input data for search
a = 0.5; b = 3.5; %Initial range of radii
itermax = 8; %Maximum number of function evaluations

%Specify the search function 
V = 4; %Volume of the cylinder
A = @(r) 2*pi*r.^2 + 2*V./r; %Area to be minimized

iter = 1;
%Start the Golden Section search
I = b-a; %Initial interval. I varies with iteration.
tau = 0.5*(sqrt(5)-1); %Golden ratio
for i = 1:itermax
    I = I*tau;  
    %Select the two points
    x1 = b - I;     x2 = a + I;
    
    %Do the two point test
    f1 = A(x1); f2 = A(x2);
    if(f1>f2)
        a = x1;
    else 
        b = x2;
    end
    
    %Print values after iteration
    prt = ['Iter = ',num2str(i),...
           ', a = ', num2str(a),...
           ', b = ', num2str(b),...
           ', err = ', num2str(b-a),...
           ];
    disp(prt);  
end
