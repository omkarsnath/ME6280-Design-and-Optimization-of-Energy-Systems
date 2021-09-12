%%Gauss Newton example
clear; clc; close all;
%Input Data
X = [10,41,79,139,202,298]';
Y = [3.1,11.8,21.1,29.8,37.4,42.5]';
N = length(X);  
tol = 1.e-10; %Error Tolerance
itermax = 10; %Maximum number of iterations

%Specify the nonlinear function and its derivatives
f = @(a,b,x) a.*(1-exp(-b.*x)); %Function
dfda = @(a,b,x) 1-exp(-b.*x); %df_da
dfdb = @(a,b,x) a.*x.*exp(-b.*x); %df_db

%Give initial guesses for a and b
a = 40.; b = 0.005;

err = 10; %Give dummy error value to start the loop
iter = 1;

while((err>tol)&&(iter<=itermax))
    %Calculate Z
    Z1 = dfda(a,b,X);
    Z2 = dfdb(a,b,X);
    Z = [Z1 Z2]; ZT = Z';
    
    %Calculate Y_hat (the fit equation) 
    Yhat = f(a,b,X);
    DY = Y-Yhat;
    
    %Solve for da and db
    RHS = ZT*DY;
    DA = (ZT*Z)\RHS;
    a = a + DA(1);
    b = b + DA(2);
    
    err = (DA(1)/a)^2 + (DA(2)/b)^2;
    %Print values after iteration
    prt = ['Iter = ',num2str(iter),...
           ', a = ', num2str(a),...
           ', b = ', num2str(b),...
           ', err = ', num2str(err),...
           ];
    disp(prt);
    
    iter = iter + 1;    
end
