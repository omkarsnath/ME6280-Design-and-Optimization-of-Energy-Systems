%Example of gradient descent -- without plots
clear; clc; close all;
N = 101;
alp = 0.05; %Learning Rate for gradient descent
x = linspace(0.6,2,N);
y = linspace(0.4,2,N);
[X,Y] = meshgrid(x,y);

f = @(x1,x2) 8+x1.^2/2 + 2./(x1.*x2) + 6*x2;
df1 = @(x1,x2) x1-2./(x1.^2.*x2);
df2 = @(x1,x2) -2./(x1.*x2.^2) + 6;

%Start the gradient descent
xs(1) = 1; xs(2) = 1; %xs -- optimal point for which we are iterating
err = 10;
tol = 1.e-5;
iter = 1; itermax = 1000;
while ((err>tol)&&(iter<itermax))
    x0 = xs;
    %Gradient Descent Step
    xs(1) = xs(1) - alp*df1(x0(1),x0(2));
    xs(2) = xs(2) - alp*df2(x0(1),x0(2));

    err = norm(xs-x0);
  
    %Print values after iteration
    prt = ['Iter = ',num2str(iter),...
           ', x1 = ', num2str(xs(1)),...
           ', x2 = ', num2str(xs(2)),...
           ', err = ', num2str(err),...
           ];
    disp(prt);  
    iter = iter + 1;
end
