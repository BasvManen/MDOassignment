clc
clear all

% INITIAL DESIGN VECTOR (31 ENTRIES)
x = zeros(31,1);
x(1)  = 20.0000;                  % Span of Outer Wing [m]
x(2)  = 12.0000;                   % Length of Root Chord [m]
x(3)  = 7.5077;                    % Length of Kink Chord [m]
x(4)  = 2.7000;                    % Length of Tip Chord [m]
x(5)  = 33.8266;                     % LE Sweep Angle of Outer Wing [deg]
x(6)  = 1.0079;                      % Wing Twist of Kink Section [deg]
x(7)  = 1.0048;                      % Wing Twist of Tip Section [deg]
x(8)  =  0.1000;     % Root Upper CST Coefficients
x(9)  =  0.1181;     %  "                       "
x(10) =  0.1566;     %  "                       "
x(11) =  0.1927;     %  "                       "
x(12) =  0.1045;     %  "                       "
x(13) =  0.1327;     %  "                       "
x(14) =  -0.1127;    % Root Lower CST Coefficients
x(15) =  -0.1060;   %  "                       "
x(16) =  -0.0830;   %  "                       "
x(17) =  -0.0710;   %  "                       "
x(18) =  -0.0646;    %  "                       "
x(19) =  -0.0665;   %  "                       "
x(20)  =  0.1000;     % Root Upper CST Coefficients
x(21)  =  0.1013;     %  "                       "
x(22) =   0.1544;     %  "                       "
x(23) =  0.1613;     %  "                       "
x(24) =  0.0572;     %  "                       "
x(25) =  0.1022;     %  "                       "
x(26) =  -0.1127;    % Root Lower CST Coefficients
x(27) =  -0.1039;   %  "                       "
x(28) =  -0.0869;   %  "                       "
x(29) =  -0.0919;   %  "                       "
x(30) =  -0.0752;    %  "                       "
x(31) =  -0.0693;   %  "                       "

disp(calcwing(x))
% Cruise Conditions
Mcr = 0.83;
velo = 251;
dens = 0.441653;
alti = 9448.8;

taper = x(4)/x(2);
MAC = (2/3)*x(2)*((1+taper+taper^2)/(1+taper));
N_Re = (dens*velo*MAC)/(9.49e-6);

% Calculate Required CL
W_ac = 166919;
D_ac = 50735;
W_MTOW = W_ac+2300+93942;
Ldes = sqrt(W_MTOW*(W_MTOW-93942));
S = 2*(((x(2)+x(3))/2)*7.56 + ((x(3)+x(4))/2)*x(1));
CL = (Ldes*9.80665)/(S*0.5*dens*velo^2);

% Wing Geometry
AC.Wing.Geom = calcwing(x);
AC.Wing.inc = 0;

% Wing Airfoil
AC.Wing.Airfoils = [x(8)  x(9)  x(10) x(11) x(12) x(13) x(14) x(15) x(16) x(17) x(18) x(19);
                    x(20) x(21) x(22) x(23) x(24) x(25) x(26) x(27) x(28) x(29) x(30) x(31)];
AC.Wing.eta = [0;1];

% Viscosity
AC.Visc = 1;
AC.Aero.MaxIterIndex = 1000;

% Flight Conditions
AC.Aero.V = velo;        
AC.Aero.rho = dens; 
AC.Aero.alt = alti;   
AC.Aero.Re = N_Re;
AC.Aero.M = Mcr;
AC.Aero.CL = CL;

% Solver
Res = Q3D_solver(AC);

% Output Results
CLwing = Res.CLwing;
CDwing = Res.CDwing;

% Calculate Total Lift and Drag
CLtot = CLwing;
CDac = D_ac/(S*0.5*dens*velo^2);
CDtot = CDwing+CDac;
CLCD = CLtot/CDtot;

aerotools = [CLtot CDtot CLCD];