% 3 variable simple problem for Gauss-Seidel
clear; clc;
Method = 1; %Which information flow method is being chosen

%Start iteration
i = 1;
x = 1; y = 1; z = 1;
e  = 100; %Initial fake value of error to start computation
tol = 1.e-4; %Tolerance
while(e>tol)
    x0 =x; y0 =y; z0 =z; %Store values from previous iteration
    
    x = (4-4*y-z)/(-6);
    y = (-2-2*x-3*z)/(-6);
    z = (-16-4*x-y)/(-9);
    
    e = sqrt((x-x0)^2 + (y-y0)^2 +(z-z0)^2);
    formatSpec = '%d %6.4f %6.4f %6.4f %6.4f\n';
    fprintf(formatSpec,i,x,y,z,e);
    i = i +1;
end
