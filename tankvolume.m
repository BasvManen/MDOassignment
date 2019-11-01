function [volume] = tankvolume(x)

% Define Airfoil Sections
CSTrootup = [x(8)  x(9)  x(10) x(11) x(12) x(13)];
CSTrootlo = [x(14) x(15) x(16) x(17) x(18) x(19)];

X = linspace(0,1,101)';
[Yru, Yrl] = D_airfoil2(CSTrootup,CSTrootlo,X);

AreaRoot = 0;

for i=21:60
    numint1 = ((abs(Yru(i+1))+abs(Yrl(i+1)))+(abs(Yru(i))+abs(Yrl(i))))*0.005;
    
    AreaRoot = AreaRoot + numint1;
end

volume = AreaRoot*x(2)^2*(7.56+x(1))*2;

end

