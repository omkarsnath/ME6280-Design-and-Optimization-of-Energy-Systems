clear; clc; close all;

%x(1)=T x(2)=k x(3)=h
fun = @equations_ht;
x0=[3000;4455;534];
x = fsolve(fun,x0)

% options = optimoptions('fsolve','Display','none','PlotFcn',@optimplotfirstorderopt);
% x = fsolve(fun,x0,options)

Compare=equations_ht(x)

