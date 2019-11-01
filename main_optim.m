clear all
close all
clc

x = [17.64 13.1 7.7 2.9 38 0 0 0.233698608660493 0.0797514269091338 0.267877614548858 0.0892791441174730 0.278358178094077 0.381411808678940 -0.225259927775114 -0.164056310299420 -0.0455965354614051 -0.478898192543423 0.0748917675336164 0.324843802364473 0.233698608660493 0.0797514269091338 0.267877614548858 0.0892791441174730 0.278358178094077 0.381411808678940 -0.225259927775114 -0.164056310299420 -0.0455965354614051 -0.478898192543423 0.0748917675336164 0.324843802364473];

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
couplings.Wwing0 = 1500;    % Initial Guess for Wing Weight [kg]
couplings.Wfuel0 = 10000;   % Initial Guess for Fuel Weight [kg]

[f, vararg] = optimization(x);
