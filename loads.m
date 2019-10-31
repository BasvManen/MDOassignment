function [loading] = loads(x, W_wing, W_fuel)
global couplings;

% Critical Conditions
Mmo = couplings.Mmo;
velo = couplings.Vmo;
dens = couplings.rhocr;
alti = couplings.hcr;

MAC = couplings.MAC;
N_Re = (dens*velo*MAC)/(9.49e-6);

% Calculate Required CL
n_max = couplings.nmax; 
W_ac = couplings.Wac;
W_MTOW = W_ac+W_fuel+W_wing;
S = couplings.S;
CL = (n_max*W_MTOW*9.80665)/(S*0.5*dens*velo^2);

% Wing Geometry
AC.Wing.Geom = calcwing(x);
AC.Wing.inc = 0;

% Wing Airfoil
AC.Wing.Airfoils = [x(8)  x(9)  x(10) x(11) x(12) x(13) x(14) x(15) x(16) x(17) x(18) x(19);
                    x(20) x(21) x(22) x(23) x(24) x(25) x(26) x(27) x(28) x(29) x(30) x(31)];
AC.Wing.eta = [0;1];

% Viscosity
AC.Visc = 0;
AC.Aero.MaxIterIndex = 150;

% Flight Conditions
AC.Aero.V = velo;        
AC.Aero.rho = dens; 
AC.Aero.alt = alti;   
AC.Aero.Re = N_Re;
AC.Aero.M = Mmo;
AC.Aero.CL = CL;

% Solver
Res = Q3D_solver(AC);

% Output Results
secCcl = Res.Wing.ccl;
secCm = Res.Wing.cm_c4;
sec = Res.Wing.Yst;
secc = Res.Wing.chord;

loading = [sec secCcl secCm secc];
end

