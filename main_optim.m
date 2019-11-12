clear all
clc

x0 = ones(31,1);
lb = normal([15 12 7.5 2.7 32 -3 -3 0.1 0.1 0 0 0 0 -0.1 -0.1 0 0 0 0 0.1 0.1 0 0 0 0 -0.1 -0.1 0 0 0 0]);
ub = normal([20 14 8.5 3.1 40  3  3 0.5 0.5 0.5 0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5 0.5 0.5 0.5 0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 -0.5 -0.5]);

% Options for the optimization
options.Algorithm       = 'sqp';
options.Display         = 'iter-detailed';
options.DiffMinChange   = 1e-3;         % Minimum change while gradient searching
options.DiffMaxChange   = 5e-1;         % Maximum change while gradient searching
options.TolFun          = 1e-3;         % Maximum difference between two subsequent objective value
options.TolX            = 1e-3;         % Maximum difference between two subsequent design vectors
options.TolCon          = 1e-3;

tic;
[x,FVAL,EXITFLAG,OUTPUT] = fmincon(@(x) optimization(x),x0,[],[],[],[],lb,ub,@(x) constraints(x),options);
toc;
