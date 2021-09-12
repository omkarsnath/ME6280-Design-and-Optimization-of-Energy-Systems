% 2 variable simple problem for Gauss-Seidel
clear; clc;
Method = 1; %Which information flow method is being chosen

%Start iteration
i = 1;
x(i) = 0; y(i) = 0;
e  = 100; %Initial fake value of error to start computation
tol = 1.e-3; %Tolerance
while(e>tol) 
    switch Method
        case 1
            x(i+1) = (3-y(i))/2; 
            y(i+1) = (3-x(i+1))/2; 
        case 2
            y(i+1) = 3 - 2*x(i); 
            x(i+1) = 3 - 2*y(i+1); 
    end  
    e = sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2)
    err(i) = e;
    i = i +1;
end
