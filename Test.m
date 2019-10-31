clear all
close all
clc

x = [17.64 11.96 7.77 2.6312 35 0 0 0.2172 0.3451 0.2972 0.2688 0.2892 0 -0.1295 -0.2392 -0.1629 -0.0482 0.0802 0 0.2172 0.3451 0.2972 0.2688 0.2892 0 -0.1295 -0.2392 -0.1629 -0.0482 0.0802 0];

global couplings;

% Constants with respect to flight conditions
couplings.Mmo = 0.88;       % Maximum Operatable Mach Number [-]
couplings.Vmo = 266;        % Speed at Mmo and h=hcr [m/s]
couplings.hcr = 9448.8;     % Cruise Height (31000ft) [m]
couplings.rhocr = 0.441653; % Density at h=hcr [kg/m3]
couplings.nmax = 2.5;       % Ultimate Load Factor [-]

% Constant with respect to aircraft characteristics
couplings.Wac = 123456;     % Weight of the Aircraft minus Fuel and Wing [kg]
couplings.Dac = 1234;       % Drag of the Aircraft minus Fuel and Wing [N]

taper = x(4)/x(2);
S = 2*(((x(2)+x(3))/2)*7.56 + ((x(3)+x(4))/2)*x(1));
MAC = (2/3)*x(2)*((1+taper+taper^2)/(1+taper));
b = 2*(7.56+x(1));
couplings.taper = taper;    % Taper Ratio of the Wing [-]
couplings.b = b;            % Total Wing Span [m]
couplings.S = S;            % Total Wing Surface Area [m2]
couplings.MAC = MAC;        % Length of the Mean Aerodynamic Chord [m]


ans1 = loads(x, 1000, 10000);
ans2 = wingstructure(x, 1000, 10000, ans1);