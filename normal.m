function [xnew] = normal(x0)

Au = [0.127448502894573;0.121370201472302;0.109661870514841;0.117909831606504;0.0932382722344031;0.128294441019925];
Al = [-0.127372892248784;-0.121708867053057;-0.108890969883614;-0.118938106721595;-0.0924428871058814;-0.128641491709723];

% INITIAL DESIGN VECTOR (31 ENTRIES)
x = zeros(31,1);
x(1)  = 17.64;                  % Span of Outer Wing [m]
x(2)  = 13.1;                   % Length of Root Chord [m]
x(3)  = 7.7;                    % Length of Kink Chord [m]
x(4)  = 2.9;                    % Length of Tip Chord [m]
x(5)  = 38;                     % LE Sweep Angle of Outer Wing [deg]
x(6)  = 1;                      % Wing Twist of Kink Section [deg]
x(7)  = 1;                      % Wing Twist of Tip Section [deg]
x(8)  =  Au(1);                 % Root Upper CST Coefficients
x(9)  =  Au(2);                 %  "                       "
x(10) =  Au(3);                 %  "                       "
x(11) =  Au(4);                 %  "                       "
x(12) =  Au(5);                 %  "                       "
x(13) =  Au(6);                 %  "                       "
x(14) =  Al(1);                 % Root Lower CST Coefficients
x(15) =  Al(2);                 %  "                       "
x(16) =  Al(3);                 %  "                       "
x(17) =  Al(4);                 %  "                       "
x(18) =  Al(5);                 %  "                       "
x(19) =  Al(6);                 %  "                       "
x(20) =  Au(1);                 % Tip Upper CST Coefficients
x(21) =  Au(2);                 %  "                      "
x(22) =  Au(3);                 %  "                      "
x(23) =  Au(4);                 %  "                      "
x(24) =  Au(5);                 %  "                      "
x(25) =  Au(6);                 %  "                      "
x(26) =  Al(1);                 % Tip Lower CST Coefficients
x(27) =  Al(2);                 %  "                      "
x(28) =  Al(3);                 %  "                      "
x(29) =  Al(4);                 %  "                      "
x(30) =  Al(5);                 %  "                      "
x(31) =  Al(6);                 %  "                      "

xnew = x0./x';

end

