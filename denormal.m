function [xnew] = denormal(x0)

% INITIAL DESIGN VECTOR (31 ENTRIES)
x = zeros(31,1);
x(1)  = 17.64;                  % Span of Outer Wing [m]
x(2)  = 13.1;                   % Length of Root Chord [m]
x(3)  = 7.7;                    % Length of Kink Chord [m]
x(4)  = 2.9;                    % Length of Tip Chord [m]
x(5)  = 38;                     % LE Sweep Angle of Outer Wing [deg]
x(6)  = 1;                      % Wing Twist of Kink Section [deg]
x(7)  = 1;                      % Wing Twist of Tip Section [deg]
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

xnew = x0.*x;
end

