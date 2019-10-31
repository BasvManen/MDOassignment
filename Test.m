clear all
close all
clc

x = [17.64 11.96 7.77 2.6312 35 0 0 0.2172 0.3451 0.2972 0.2688 0.2892 0 -0.1295 -0.2392 -0.1629 -0.0482 0.0802 0 0.2172 0.3451 0.2972 0.2688 0.2892 0 -0.1295 -0.2392 -0.1629 -0.0482 0.0802 0];

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

winit = 1000;
finit = 10000;
wnew = 0;
fnew = 0;
error = sqrt((winit-wnew)^2+(finit-fnew)^2);

while error > 10000
    ans1 = loads(x, winit, finit);
    wnew = wingstructure(x, winit, finit, ans1);
    ans2 = aero(x, wnew, finit);
    fnew = performance(wnew, finit, ans2);
    error = sqrt((winit-wnew)^2+(finit-fnew)^2);
    winit = wnew;
    finit = fnew;
    disp(wnew)
    disp(fnew)
end