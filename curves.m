function [out1,out2] = curves(fir,sec,points,tmp)
    a=check_curves(points(1,1),points(1,2),tmp,0);
    b=check_curves(points(2,1),points(2,2),tmp,0);
    if(a>b),out1=fir+a-b;out2=sec;else,out1=fir;out2=sec+b-a;end
end
