clear all
x = [13.32 11.18 0.57 0.59 4.7 34 0 0];

geom = calcwing(x);
plot([geom(1,1) geom(2,1) geom(3,1) geom(3,1)+geom(3,4) geom(2,1)+geom(2,4) geom(1,1)+geom(1,4)],[geom(1,2) geom(2,2) geom(3,2) geom(3,2) geom(2,2) geom(1,2)]);