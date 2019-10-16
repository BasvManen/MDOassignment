function geom = calcwing(x)

b = x(1);
c_r = x(2);
c_t = x(3);
sweep_LE = pi*x(4)/180;
e_t1 = x(5);
e_t2 = x(6);

%Chord
geom(1,1) = 0;
geom(1,2) = 0;
geom(1,3) = 0;
geom(1,4) = c_r;
geom(1,5) = 0;

%Kink
geom(2,1) = 7.56*tan(sweep_LE);
geom(2,2) = 7.56;
geom(2,3) = 0;
geom(2,4) = c_r+7.56*(tan(pi*6/180)-tan(sweep_LE));
geom(2,5) = e_t1;

%Tip
geom(3,1) = (7.56+b)*tan(sweep_LE);
geom(3,2) = 7.56+b;
geom(3,3) = 0;
geom(3,4) = c_t;
geom(3,5) = e_t2;
end

