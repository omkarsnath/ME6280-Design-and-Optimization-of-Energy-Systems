objective = @Q2_Objective;
constraints = @Q2_Constraints;

x_0 = [2 2 2];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0 0 0];
ub = [5 5 5];

[X_opt] = fmincon(objective, x_0, A, b, Aeq, beq, lb, ub, constraints);

x1_opt = X_opt(1);
x2_opt = X_opt(2);
x3_opt = X_opt(3);

fprintf('Optimal x1 = %i\n',x1_opt);
fprintf('Optimal x2 = %i\n',x2_opt);
fprintf('Optimal x3 = %i\n',x3_opt);

fprintf('\nOmkar Nath - ME17B158\n');