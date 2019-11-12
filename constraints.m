function [c,ceq] = constraints(x0)

x = denormal(x0);

global couplings;

MTOW = couplings.MTOW;
Fuel = couplings.Fuel;

c1 = ((Fuel/0.81715E3) - 0.93*tankvolume(x))/314.9426;
c2 = (wingloading(x, MTOW) - 750)/31.3093;

c = [c1,c2];
ceq = [];
end

