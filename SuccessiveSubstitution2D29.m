% 2 variable problem for successive substitution
clear; clc;
a1 = 100; a2 = 9.5; a3 = 1.8;
b1 = 20; b2 = 4.8e-5; b3 = 2;
Method = 2; %Which information flow method is being chosen

%Start iteration
i = 1;
P(i) = 250; Q(i) = 10;
err(i) = 100; %Initial fake value of error to start computation
tol = 1.e-9; %Tolerance
while((err>tol)) 
    switch Method
        case 1
            P(i+1) = a1 + a2*Q(i)^a3; %Duct
            Q(i+1) = b1 - b2*P(i)^b3; %Fan
        case 2
            Q(i+1) = ((P(i) - a1)/a2)^(1./a3); %Duct
            P(i+1) = ((b1 - Q(i))/b2)^(1./b3); %Fan
    end
    e = ((P(i+1)-P(i))/(P(i)))^2 + ((Q(i+1)-Q(i))/(Q(i)))^2 %Relative err
    err(i) = e;
    i = i +1;
end
