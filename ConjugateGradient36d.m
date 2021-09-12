%Example of conjugate gradient method
clear; clc; close all;
N = 101;
x = linspace(-2,2,N);
y = linspace(-2,2,N);
[X,Y] = meshgrid(x,y);

f = @(x1,x2) x1 - x2 +2*x1^2 +2*x1*x2 +x2^2;
df1 = @(x1,x2) 1 + 4*x1 + 2*x2;
df2 = @(x1,x2) -1 + 2*x1 + 2*x2;
%Hessian
df11 = @(x1,x2) 4;%Second derivates
df12 = @(x1,x2) 2;
df22 = @(x1,x2) 2;
%Calculate function at all points for plotting
for j = 1:N
    for i = 1:N
        F(i,j) = f(x(i),y(j));
    end
end

%Plot what the contours of the function look like
contourf(x,y,F,30); axis square;
xlabel('x'); ylabel('y');
title('Conjugate Gradient');
hold on;
xx = -1; yy = 1.5;
plot(xx,yy,'bs'); %Plot the final optimal point for reference

%Start conjugate gradient
xs = [0;0]; %xs -- optimal point for which we are iterating
% plot(xs(1),xs(2),'rx');

tol = 1.e-5;
iter = 1;
%First Step of Conjugate Gradient
x0 = xs;
x1 = xs(1); x2 = xs(2);

G = [df1(x1,x2); df2(x1,x2)]; %Gradient of f
S = -G;
A = [df11(x1,x2)  df12(x1,x2); df12(x1,x2) df22(x1,x2)];

lam = (G(1)^2 + G(2)^2)/(S'*A*S);
xs = xs + lam*S;
err = norm(xs-x0);
itermax = 100;
while ((err>tol)&&(iter<=itermax))
    plot([x0(1) xs(1)],[x0(2) xs(2)],'r-x'); hold on;
    x1 = xs(1); x2 = xs(2);

    G = [df1(x1,x2); df2(x1,x2)]; %Gradient of f
    G0 = [df1(x0(1),x0(2)); df2(x0(1),x0(2))]; %Gradient of f at previous 
    A = [df11(x1,x2)  df12(x1,x2); df12(x1,x2) df22(x1,x2)]; %Hessian
    %Conjugate direction
    beta = (norm(G)/norm(G0))^2;
    S = -G + beta*S;

    lam = (G(1)^2 + G(2)^2)/(S'*A*S);

    x0 = xs;
    xs = xs + lam*S;
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
