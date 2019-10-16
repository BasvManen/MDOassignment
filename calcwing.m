function geom = calcwing(x)

S_1 = x(1);
S_2 = x(2);
taper_1 = x(3);
taper_2 = x(4);
c_r = x(5);
sweep_LE = pi*x(6)/180;
e_t1 = x(7);
e_t2 = x(8);

%Chord
geom(1,1) = 0;
geom(1,2) = 0;
geom(1,3) = 0;
geom(1,4) = c_r;
geom(1,5) = 0;

%Kink
b_1 = ((2*S_1)/((1+taper_1)*c_r));
geom(2,1) = b_1*tan(sweep_LE);
geom(2,2) = b_1;
geom(2,3) = 0;
geom(2,4) = taper_1*c_r;
geom(2,5) = e_t1;

%Tip
b_2 = b_1+((2*S_2)/((taper_1+taper_1*taper_2)*c_r));
geom(3,1) = b_2*tan(sweep_LE);
geom(3,2) = b_2;
geom(3,3) = 0;
geom(3,4) = taper_1*taper_2*c_r;
geom(3,5) = e_t2;
end

