function [f,vararg] = optimization(x0)

x = denormal(x0);
global couplings;

% Constants with respect to flight conditions
couplings.Mmo = 0.88;       % Maximum Operatable Mach Number [-]
couplings.Mcr = 0.83;       % Cruise Mach Number [-]
couplings.Vmo = 266;        % Speed at Mmo and h=hcr [m/s]
couplings.Vcr = 251;        % Speed at Mcr and h=hcr [m/s]
couplings.hcr = 9448.8;     % Cruise Height (31000ft) [m]
couplings.rhocr = 0.441653; % Density at h=hcr [kg/m3]
couplings.range = 7408e3;   % Aircraft Range (4000nm) [m]
couplings.nmax = 2.5;       % Ultimate Load Factor [-]

% Constant with respect to aircraft characteristics
couplings.Wac = 166919;     % Weight of the Aircraft minus Fuel and Wing [kg]
couplings.Dac = 50735;      % Drag of the Aircraft minus Fuel and Wing [N]

taper = x(4)/x(2);
S = 2*(((x(2)+x(3))/2)*7.56 + ((x(3)+x(4))/2)*x(1));
MAC = (2/3)*x(2)*((1+taper+taper^2)/(1+taper));
b = 2*(7.56+x(1));
couplings.taper = taper;    % Taper Ratio of the Wing [-]
couplings.b = b;            % Total Wing Span [m]
couplings.S = S;            % Total Wing Surface Area [m2]
couplings.MAC = MAC;        % Length of the Mean Aerodynamic Chord [m]

% Initial Guesses for the MDA Convergence Loop
couplings.Wwing0 = 2300;    % Initial Guess for Wing Weight [kg]
couplings.Wfuel0 = 93942;   % Initial Guess for Fuel Weight [kg]

disp(x)
[W_wing, W_fuel] = MDA(x);

f0 = objective(W_wing, W_fuel);
vararg = [W_wing, W_fuel];

couplings.Fuel = W_fuel;
couplings.MTOW = W_wing+W_fuel+couplings.Wac;

f = f0/2.6895E5;

end

