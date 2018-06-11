function cross = isCross(a,b,c,d)
    p1 = b(2)-a(2);
    p2 = a(1)-b(1);
    p3 = b(1)*a(2)-a(1)*b(2);

    q1 = d(2)-c(2);
    q2 = c(1)-d(1);
    q3 = d(1)*c(2)-c(1)*d(2);

    sign1 = ( p1*c(1)+p2*c(2)+p3 ) * ( p1*d(1)+p2*d(2)+p3 );
    sign2 = ( q1*a(1)+q2*a(2)+q3 ) * ( q1*b(1)+q2*b(2)+q3 );
    % cross = sign1*sign2<0; ­×§ï¦¹¦æ
    cross = (sign1 <= 0 && sign2 <= 0);
end
