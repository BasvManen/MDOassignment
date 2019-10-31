function geom = calcwing(x)

l_out = x(1);
c_r = x(2);
c_k = x(3);
c_t = x(4);
sweep_out = x(5);
twist_k = x(6);
twist_t = x(7);

%Chord
geom(1,1) = 0;
geom(1,2) = 0;
geom(1,3) = 0;
geom(1,4) = c_r;
geom(1,5) = 0;

%Kink
geom(2,1) = c_r+7.56*tan(6*pi/180)-c_k;
geom(2,2) = 7.56;
geom(2,3) = 0;
geom(2,4) = c_k;
geom(2,5) = twist_k;

%Tip
geom(3,1) = geom(2,1)+l_out*tan(sweep_out*pi/180);
geom(3,2) = 7.56+l_out;
geom(3,3) = 0;
geom(3,4) = c_t;
geom(3,5) = twist_t;
end

