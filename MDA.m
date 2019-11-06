function [W_wing, W_fuel] = MDA(x)
global couplings;

W_wing0 = couplings.Wwing0;
W_fuel0 = couplings.Wfuel0;

counter = 0;
error = 1;

while error > 0.01
    counter = counter+1;
    ans1 = loads(x,W_wing0,W_fuel0);
    W_wing1 = wingstructure(x,W_wing0,W_fuel0,ans1);
    ans2 = aero(x,W_wing1,W_fuel0);
    W_fuel1 = performance(W_wing1,W_fuel0,ans2);
    error = (abs(W_fuel0-W_fuel1)/W_fuel1+abs(W_wing0-W_wing1)/W_wing1);
    W_wing0 = W_wing1;
    W_fuel0 = W_fuel1;
end

W_wing = W_wing1;
W_fuel = W_fuel1;

end

