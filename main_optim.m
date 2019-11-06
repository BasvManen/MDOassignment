clear all
clc

x0 = ones(31,1);
lb = normal([15  12 7 2.7 30 -3 -3 0 0 0 0 0 0 0 0 0 0 -1 -1 0 0 0 0 0 0 0 0 0 0 -1 -1]);
ub = normal([20 15 9 3.1 40  3  3 1 1 1 1 1 1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 -1 -1 -1 -1 1 1]);

% Options for the optimization
options.Algorithm       = 'sqp';
options.Display         = 'iter-detailed';
options.DiffMinChange   = 1e-2;         % Minimum change while gradient searching
options.DiffMaxChange   = 5e-1;         % Maximum change while gradient searching
options.TolFun          = 1000;         % Maximum difference between two subsequent objective value
options.TolX            = 5e-1;         % Maximum difference between two subsequent design vectors
options.TolCon          = 5e-1;

tic;
[x,FVAL,EXITFLAG,OUTPUT] = fmincon(@(x) optimization(x),x0,[],[],[],[],lb,ub,@(x) constraints(x),options);
toc;
