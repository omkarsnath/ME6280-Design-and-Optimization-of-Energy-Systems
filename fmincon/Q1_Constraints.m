function [c, ceq] = Q1_Constraints(x)
%Q1_Constraints Constraint Function

c(1) = x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(1) - x(2) + x(3) - x(4) - 100;
c(2) = x(1)^2 + 2*x(2)^2 + x(3)^2 + 2*x(4)^2 - x(1) - x(4) - 10;
c(3) = 2*x(1)^2 + x(2)^2 + x(3)^2 + 2*x(1) - x(2) - x(4) - 5;

ceq = [];

end

