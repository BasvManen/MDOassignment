function [c,ceq] = constraints(x0)

% INITIAL DESIGN VECTOR (31 ENTRIES)
xinit = zeros(1,31);
xinit(1)  = 17.64;                  % Span of Outer Wing [m]
xinit(2)  = 13.1;                   % Length of Root Chord [m]
xinit(3)  = 7.7;                    % Length of Kink Chord [m]
xinit(4)  = 2.9;                    % Length of Tip Chord [m]
xinit(5)  = 38;                     % LE Sweep Angle of Outer Wing [deg]
xinit(6)  = 1;                      % Wing Twist of Kink Section [deg]
xinit(7)  = 1;                      % Wing Twist of Tip Section [deg]
xinit(8)  =  0.233698608660493;     % Root Upper CST Coefficients
xinit(9)  =  0.0797514269091338;    %  "                       "
xinit(10) =  0.267877614548858;     %  "                       "
xinit(11) =  0.0892791441174730;    %  "                       "
xinit(12) =  0.278358178094077;     %  "                       "
xinit(13) =  0.381411808678940;     %  "                       "
xinit(14) = -0.225259927775114;     % Root Lower CST Coefficients
xinit(15) = -0.164056310299420;     %  "                       "
xinit(16) = -0.0455965354614051;    %  "                       "
xinit(17) = -0.478898192543423;     %  "                       "
xinit(18) =  0.0748917675336164;    %  "                       "
xinit(19) =  0.324843802364473;     %  "                       "
xinit(20) =  0.233698608660493;     % Tip Upper CST Coefficients
xinit(21) =  0.0797514269091338;    %  "                      "
xinit(22) =  0.267877614548858;     %  "                      "
xinit(23) =  0.0892791441174730;    %  "                      "
xinit(24) =  0.278358178094077;     %  "                      "
xinit(25) =  0.381411808678940;     %  "                      "
xinit(26) = -0.225259927775114;     % Tip Lower CST Coefficients
xinit(27) = -0.164056310299420;     %  "                      "
xinit(28) = -0.0455965354614051;    %  "                      "
xinit(29) = -0.478898192543423;     %  "                      "
xinit(30) =  0.0748917675336164;    %  "                      "
xinit(31) =  0.324843802364473;     %  "                      "

x = x0.*xinit';

global couplings;

MTOW = couplings.MTOW;
Fuel = couplings.Fuel;

c1 = Fuel*0.81715 - 0.93*tankvolume(x);
c2 = wingloading(x, MTOW) - 716.99;

c = [c1,c2];
ceq = [];
end

