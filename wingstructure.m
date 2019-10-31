function [W_str] = wingstructure(x, W_wing, W_fuel, loading)
global couplings;

% Make Files for Cartesian Coordinates of Airfoils
lstrootup = [x(8)  x(9)  x(10) x(11) x(12) x(13)];
lstrootlo = [x(14) x(15) x(16) x(17) x(18) x(19)];
lsttipup =  [x(20) x(21) x(22) x(23) x(24) x(25)];
lsttiplo =  [x(26) x(27) x(28) x(29) x(30) x(31)];

xcoor = linspace(0, 1, 101)';
[AFrootup, AFrootlo] = D_airfoil2(lstrootup, lstrootlo, xcoor);
[AFtipup, AFtiplo] = D_airfoil2(lsttipup, lsttiplo, xcoor);

fid = fopen('DC10root.dat','wt');
for i = 1:length(xcoor)
    fprintf(fid,'%g %g\n',AFrootup(i,1),AFrootup(i,2));
end
for i = 1:length(xcoor)
    fprintf(fid,'%g %g\n',AFrootlo(i,1),AFrootlo(i,2));
end
fclose(fid);

fid = fopen('DC10tip.dat','wt');
for i = 1:length(xcoor)
    fprintf(fid,'%g %g\n',AFtipup(i,1),AFtipup(i,2));
end
for i = 1:length(xcoor)
    fprintf(fid,'%g %g\n',AFtiplo(i,1),AFtiplo(i,2));
end
fclose(fid);

% Define Wing Planform in Cartesian Coordinates
geom = calcwing(x);

% Initial Values
velo = couplings.Vmo; 
dens = couplings.rhocr;
q = 0.5*dens*velo^2;

n_max = couplings.nmax;   
W_ac = couplings.Wac;  
W_MTOW = W_ac+W_wing+W_fuel;
W_MZFW = W_MTOW-W_fuel;
S = couplings.S;
b = couplings.b;
MAC = couplings.MAC;

fid = fopen('DC10.init','wt');
fprintf(fid,'%g %g\n',W_MTOW,W_MZFW);
fprintf(fid,'%g\n',n_max);
fprintf(fid,'%g %g %g %g\n',S,b,3,2);
fprintf(fid,'%g %s\n',0,'DC10root');
fprintf(fid,'%g %s\n',1,'DC10tip');
fprintf(fid,'%g %g %g %g %g %g\n',x(2),geom(1,1),geom(1,2),geom(1,3),0.2,0.6);
fprintf(fid,'%g %g %g %g %g %g\n',x(3),geom(2,1),geom(2,2),geom(2,3),0.2,0.6);
fprintf(fid,'%g %g %g %g %g %g\n',x(4),geom(3,1),geom(3,2),geom(3,3),0.2,0.6);
fprintf(fid,'%g %g\n',0,0.85);
fprintf(fid,'%g\n',1);
fprintf(fid,'%g %g\n',0.32,5035);
fprintf(fid,'%g %g %g %g\n',7e10,2800,2.95e8,2.95e8);
fprintf(fid,'%g %g %g %g\n',7e10,2800,2.95e8,2.95e8);
fprintf(fid,'%g %g %g %g\n',7e10,2800,2.95e8,2.95e8);
fprintf(fid,'%g %g %g %g\n',7e10,2800,2.95e8,2.95e8);
fprintf(fid,'%g %g\n',0.96,0.5);
fprintf(fid,'%g\n',0);
fclose(fid);

pos = loading(:,1)/(b/2);
L = loading(:,2)*q;
M = loading(:,4).*loading(:,3)*q*MAC;

fid = fopen('DC10.load','wt');
for i = 1:length(pos)
    fprintf(fid,'%g %g %g\n',pos(i),L(i),M(i));
end
fclose(fid);

EMWET DC10

data = importdata('DC10.weight');
W_str = data.data;


