%{
    tmp,output
    1 2 3
    4 x 5
    6 7 8
    points
    1 2
    3 4

    a b
    c d
%}
function [out1,out2] = islands(fir,sec,points,tmp)
    a=check_islands(tmp(points(1,1),points(1,2),:),8);
    b=check_islands(tmp(points(2,1),points(2,2),:),6);
    c=check_islands(tmp(points(3,1),points(3,2),:),3);
    d=check_islands(tmp(points(4,1),points(4,2),:),1);
    n1=0;
    n2=0;
    if(a==1^d==1)&&b==0&&c==0,n1=1;end
    if(b==1^c==1)&&a==0&&d==0,n2=1;end
    if(n1==1&&n2==0)
        out1=fir+5;out2=sec;
    elseif(n1==0&&n2==1)
        out1=fir;out2=sec+5;
    else
        out1=fir;out2=sec;
    end
end

