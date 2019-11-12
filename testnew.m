clear all
clc

x = ones(31,1);

f = optimization(x);

global couplings;
disp(couplings.Fuel)
disp(couplings.MTOW)

c = constraints(x);