function [c, ceq] = Q2_Constraints(x)
%Question 2 Constraint Function

c(1) = x(1)^2 + x(2)^2 - x(3)^2;
c(2) = -x(1)^2 - x(2)^2 - x(3)^2 + 4;
c(3) = (x(2)^2) * (x(3)^2) - 6;

ceq(1) = x(1)^5 + x(2)^4 + x(3)^2 - sqrt(2)*x(3) - 4;

end

