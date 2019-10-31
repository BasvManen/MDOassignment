function [loading] = loads(x, W_wing, W_fuel)

% Critical Conditions
Mmo = 0.88;      % Critical Mach number [-]
velo = 266;      % Velocity at M=0.88 and h=31000ft [m/s]
dens = 0.441653; % Density at h=31000ft [kg/m3]
alti = 9448.8;   % h=31000ft [m]

% Calculate Reynolds Number
taper = x(4)/x(2);
MAC = (2/3)*x(2)*((1+taper+taper^2)/(1+taper));
N_Re = (dens*velo*MAC)/(9.49e-6);

% Calculate Required CL
n_max = 2.5;      % Ultimate Load Factor [-]
W_ac = 123456;    % Weight of Aircraft minus Fuel and Wing [kg]
W_MTOW = W_ac+W_fuel+W_wing;
S = 2*(((x(2)+x(3))/2)*7.56 + ((x(3)+x(4))/2)*x(1));
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

