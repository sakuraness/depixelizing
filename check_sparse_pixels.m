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
function n = check_sparse_pixels(r,c,i,j,tmp,check);
    h=size(tmp,1);
    w=size(tmp,2);
    check(r,c)=1;
    if(r-1>0&&  c-1>0&& i-1>0&& j-1>0&&     tmp(i,j,1)==1&&check(r-1,c-1)==0)       ,a=check_sparse_pixels(r-1,c-1,i-1,j-1,tmp,check);else,a=0;end
    if(r-1>0&&          i-1>0&&             tmp(i,j,2)==1&&check(r-1,c)==0)         ,b=check_sparse_pixels(r-1,c,  i-1,j,  tmp,check);else,b=0;end
    if(r-1>0&&  c+1<=8&&i-1>0&& j+1<=w&&    tmp(i,j,3)==1&&check(r-1,c+1)==0)       ,c=check_sparse_pixels(r-1,c+1,i-1,j+1,tmp,check);else,c=0;end
    if(         c-1>0&&         j-1>0&&     tmp(i,j,4)==1&&check(r,c-1)==0)         ,d=check_sparse_pixels(r,  c-1,i,  j-1,tmp,check);else,d=0;end
    if(         c+1<=8&&        j+1<=w&&    tmp(i,j,5)==1&&check(r,c+1)==0)         ,e=check_sparse_pixels(r,  c+1,i,  j+1,tmp,check);else,e=0;end
    if(r+1<=8&& c-1>0&& i+1<=h&&j-1>0&&     tmp(i,j,6)==1&&check(r+1,c-1)==0)       ,f=check_sparse_pixels(r+1,c-1,i+1,j-1,tmp,check);else,f=0;end
    if(r+1<=8&&         i+1<=h&&            tmp(i,j,7)==1&&check(r+1,c)==0)         ,g=check_sparse_pixels(r+1,c,  i+1,j,  tmp,check);else,g=0;end
    if(r+1<=8&& c+1<=8&&i+1<=h&&j+1<=w&&    tmp(i,j,8)==1&&check(r+1,c+1)==0)       ,h=check_sparse_pixels(r+1,c+1,i+1,j+1,tmp,check);else,h=0;end
    n=a+b+c+d+e+f+g+h;
end

