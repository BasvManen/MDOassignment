function [volume] = tankvolume(x)

endtank = 0.85*(x(1)+7.56);
endchord = x(2)+(endtank/(x(1)+7.56))*(x(4)-x(2));

% Define Airfoil Sections
CSTrootup = [x(8)  x(9)  x(10) x(11) x(12) x(13)];
CSTrootlo = [x(14) x(15) x(16) x(17) x(18) x(19)];

CSTkinkup = x(8:13)+(7.56/(x(1)+7.56))*(x(20:25)-x(8:13));
CSTkinklo = x(14:19)+(7.56/(x(1)+7.56))*(x(26:31)-x(14:19));

CSTendup = x(8:13)+(endtank/(x(1)+7.56))*(x(20:25)-x(8:13));
CSTendlo = x(14:19)+(endtank/(x(1)+7.56))*(x(26:31)-x(14:19));

X = linspace(0,1,101)';
[Yru, Yrl] = D_airfoil2(CSTrootup,CSTrootlo,X);
[Yku, Ykl] = D_airfoil2(CSTkinkup,CSTkinklo,X);
[Yeu, Yel] = D_airfoil2(CSTendup,CSTendlo,X);

AreaRoot = 0;
AreaKink = 0;
AreaEnd = 0;

for i=21:60
    numint1 = ((abs(Yru(i+1))+abs(Yrl(i+1)))+(abs(Yru(i))+abs(Yrl(i))))*0.005;
    numint2 = ((abs(Yku(i+1))+abs(Ykl(i+1)))+(abs(Yku(i))+abs(Ykl(i))))*0.005;
    numint3 = ((abs(Yeu(i+1))+abs(Yel(i+1)))+(abs(Yeu(i))+abs(Yel(i))))*0.005;
    AreaRoot = AreaRoot + numint1;
    AreaKink = AreaKink + numint2;
    AreaEnd = AreaEnd + numint3;
end

volume = ((AreaRoot*x(2)^2 + AreaKink*x(3)^2)/2)*7.56+((AreaKink*x(3)^2 + AreaEnd*endchord^2)/2)*0.85*x(1);

end

