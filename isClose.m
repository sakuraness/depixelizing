function value = isClose(yuv1, yuv2)

y = abs(yuv1(1)-yuv2(1));
u = abs(yuv1(2)-yuv2(2));
v = abs(yuv1(3)-yuv2(3));

if(y<=80 && u<=10 && v<=10)
    value = true;
else
    value = false;
end

end

