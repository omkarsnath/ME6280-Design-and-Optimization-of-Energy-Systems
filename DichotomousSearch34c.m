%%Gauss Newton example
clear; clc; close all;

%Input data for search
a = 0.5; b = 3.5; %Initial range of radii
del = 0.001; %Delta for placing the search points
funcmax = 8; %Maximum number of function evaluations
itermax = funcmax/2; %Maximum iterations of the 2 point rule

%Specify the search function 
V = 4; %Volume of the cylinder
A = @(r) 2*pi*r.^2 + 2*V./r; %Area to be minimized

iter = 1;
%Start the dichotomous search
for i = 1:itermax
    L = b-a; %Initial interval. Note that a and b change with iterations
    %Select the two points
    x1 = b - (L+del)/2;     x2 = a + (L+del)/2;
    
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
