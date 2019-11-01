function [WS] = wingloading(x, f)

S = 2*(7.56*0.5*(x(2)+x(3))+x(1)*0.5*(x(3)+x(4)));
W = f;

WS = W/S;
end

