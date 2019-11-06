clear all
clc

W_MTOW = 263636;

% INITIAL DESIGN VECTOR (31 ENTRIES)
x = zeros(1,31);
x(1)  = 17.64;                  % Span of Outer Wing [m]
x(2)  = 13.1;                   % Length of Root Chord [m]
x(3)  = 7.7;                    % Length of Kink Chord [m]
x(4)  = 2.9;                    % Length of Tip Chord [m]
x(5)  = 38;                     % LE Sweep Angle of Outer Wing [deg]
x(6)  = 0;                      % Wing Twist of Kink Section [deg]
x(7)  = 0;                      % Wing Twist of Tip Section [deg]
x(8)  =  0.233698608660493;     % Root Upper CST Coefficients
x(9)  =  0.0797514269091338;    %  "                       "
x(10) =  0.267877614548858;     %  "                       "
x(11) =  0.0892791441174730;    %  "                       "
x(12) =  0.278358178094077;     %  "                       "
x(13) =  0.381411808678940;     %  "                       "
x(14) = -0.225259927775114;     % Root Lower CST Coefficients
x(15) = -0.164056310299420;     %  "                       "
x(16) = -0.0455965354614051;    %  "                       "
x(17) = -0.478898192543423;     %  "                       "
x(18) =  0.0748917675336164;    %  "                       "
x(19) =  0.324843802364473;     %  "                       "
x(20) =  0.233698608660493;     % Tip Upper CST Coefficients
x(21) =  0.0797514269091338;    %  "                      "
x(22) =  0.267877614548858;     %  "                      "
x(23) =  0.0892791441174730;    %  "                      "
x(24) =  0.278358178094077;     %  "                      "
x(25) =  0.381411808678940;     %  "                      "
x(26) = -0.225259927775114;     % Tip Lower CST Coefficients
x(27) = -0.164056310299420;     %  "                      "
x(28) = -0.0455965354614051;    %  "                      "
x(29) = -0.478898192543423;     %  "                      "
x(30) =  0.0748917675336164;    %  "                      "
x(31) =  0.324843802364473;     %  "                      "

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

loads(x, couplings.Wwing0, couplings.Wfuel0)