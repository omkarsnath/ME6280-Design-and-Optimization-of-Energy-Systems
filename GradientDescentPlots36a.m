%Example of gradient descent
clear; clc; close all;
N = 101;
alp = 0.05; %Learning Rate for gradient descent
x = linspace(0.6,2,N);
y = linspace(0.4,2,N);
[X,Y] = meshgrid(x,y);

f = @(x1,x2) 8+x1.^2/2 + 2./(x1.*x2) + 6*x2;
df1 = @(x1,x2) x1-2./(x1.^2.*x2);
df2 = @(x1,x2) -2./(x1.*x2.^2) + 6;


%Calculate function at all points for plotting
for j = 1:N
    for i = 1:N
        F(i,j) = f(x(i),y(j));
    end
end

%Plot what the contours of the function look like
contourf(x,y,F,20); colorbar;
xlabel('x'); ylabel('y');
title('Contour of function values');
hold on;

%Start the gradient descent
xs(1) = 1; xs(2) = 1; %xs -- optimal point for which we are iterating
%plot(xs(1),xs(2),'rx');
err = 10;
tol = 1.e-5;
iter = 1; itermax = 100;
xx = 1.6438; yy = 0.45032;
plot(xx,yy,'bs'); %Plot the final optimal point for reference
while ((err>tol)&&(iter<itermax))
    x0 = xs;
    %Gradient Descent Step
    xs(1) = xs(1) - alp*df1(x0(1),x0(2));
    xs(2) = xs(2) - alp*df2(x0(1),x0(2));
    plot([x0(1) xs(1)],[x0(2) xs(2)],'r-x'); hold on;
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
