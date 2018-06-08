function result = isCross(p1, p2, p3, p4)

% mx+y=c
m1 = -(p1(1)-p2(1))/(p1(2)-p2(2));
m2 = -(p3(1)-p4(1))/(p3(2)-p4(2));
c1 = m1*p1(1) + p1(2);
c2 = m2*p3(1) + p3(2);

% find cross point
A = [m1, 1; m2, 1];
C = [c1; c2];
x = A\C; % x = [x; y]

% check the point is on the lines
rx1 = (x(1)-p1(1))*(x(1)-p2(1));
rx2 = (x(1)-p3(1))*(x(1)-p4(1));
ry1 = (x(2)-p1(2))*(x(2)-p2(2));
ry2 = (x(2)-p3(2))*(x(2)-p4(2));

if ((rx1<0)&&(rx2<0)&&(ry1<0)&&(ry2<0))
    result = true;
else
    result = false;
end

end

