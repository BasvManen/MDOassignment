function [W_MTOW] = objective(W_wing, W_fuel)
global couplings;
W_ac = couplings.Wac;

W_MTOW = W_ac+W_wing+W_fuel;
end

