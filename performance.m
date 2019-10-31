function fuel = performance(W_wing, W_fuel, aerotools)
global couplings;

% Performance Parameters
V = couplings.Vcr;
R = couplings.range;
CT = 1.8639e-4;
CLCD = aerotools(3);

W_ac = couplings.Wac;
W_MTOW = W_ac+W_wing+W_fuel;

% Calculate Cruise Fraction
exponent = R/((V/CT)*CLCD);
f_cr = exp(exponent);

% Calculate Total Fuel Required
fuel = (1-0.938*f_cr^-1)*W_MTOW;
end

