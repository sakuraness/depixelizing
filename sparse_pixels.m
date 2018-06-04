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
function [out1,out2] = sparse_pixels(fir,sec,points,tmp)
    global check;
    check=uint8(zeros(8,8));
    a=check_sparse_pixels(4,4,points(1,1),points(1,2),tmp);
    b=check_sparse_pixels(5,4,points(1,1),points(1,2),tmp);
    if(a>b),out1=fir;out2=sec+a-b;else,out1=fir+b-a;out2=sec;end
    clear global check;
end

