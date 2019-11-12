function [aerotools] = aero(x, W_wing, W_fuel)
global couplings;

% Cruise Conditions
Mcr = couplings.Mcr;
velo = couplings.Vcr;
dens = couplings.rhocr;
alti = couplings.hcr;

MAC = couplings.MAC;
N_Re = (dens*velo*MAC)/(9.49e-6);

% Calculate Required CL
W_ac = couplings.Wac;
D_ac = couplings.Dac;
W_MTOW = W_ac+W_fuel+W_wing;
Ldes = sqrt(W_MTOW*(W_MTOW-W_fuel));
S = couplings.S;
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
end

