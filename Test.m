clear all
close all
clc

x = [15.7872 11.9922 6.3756 2.8842 38 0 0 0.233698608660493 0.0797514269091338 0.267877614548858 0.0892791441174730 0.278358178094077 0.381411808678940 -0.225259927775114 -0.164056310299420 -0.0455965354614051 -0.478898192543423 0.0748917675336164 0.324843802364473 0.233698608660493 0.0797514269091338 0.267877614548858 0.0892791441174730 0.278358178094077 0.381411808678940 -0.225259927775114 -0.164056310299420 -0.0455965354614051 -0.478898192543423 0.0748917675336164 0.324843802364473];

% Cruise Conditions
Mcr = 0.83;
velo = 251;
dens = 0.441653;
alti = 9448.8;

taper = x(4)/x(2);
S = 2*(((x(2)+x(3))/2)*7.56 + ((x(3)+x(4))/2)*x(1));
MAC = (2/3)*x(2)*((1+taper+taper^2)/(1+taper));
b = 2*(7.56+x(1));
N_Re = (dens*velo*MAC)/(9.49e-6);

% Calculate Required CL
W_MTOW = 263636;
W_fuel = 93942;
Ldes = sqrt(W_MTOW*(W_MTOW-W_fuel));
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
AC.Aero.MaxIterIndex = 150;

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