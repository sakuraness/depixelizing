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
function n = check_sparse_pixels(r,c,i,j,tmp)
    global check;
    h=size(tmp,1);
    w=size(tmp,2);
    check(r,c)=1;
    m=[0,0,0,0,0,0,0,0];
    if(r-1>0&&  c-1>0&& i-1>0&& j-1>0)
        if(tmp(i,j,1)==1&&check(r-1,c-1)==0)
            m(1)=check_sparse_pixels(r-1,c-1,i-1,j-1,tmp);end
    end
    if(r-1>0&&          i-1>0)
        if(tmp(i,j,2)==1&&check(r-1,c)==0)
            m(2)=check_sparse_pixels(r-1,c,  i-1,j,  tmp);end
    end
    if(r-1>0&&  c+1<=8&&i-1>0&& j+1<=w)
        if(tmp(i,j,3)==1&&check(r-1,c+1)==0)
            m(3)=check_sparse_pixels(r-1,c+1,i-1,j+1,tmp);end
    end
    if(         c-1>0&&         j-1>0)
        if(tmp(i,j,4)==1&&check(r,c-1)==0)         
            m(4)=check_sparse_pixels(r,  c-1,i,  j-1,tmp);end
    end
    
    if(         c+1<=8&&        j+1<=w)
        if(tmp(i,j,5)==1&&check(r,c+1)==0)         
            m(5)=check_sparse_pixels(r,  c+1,i,  j+1,tmp);end
    end
    if(r+1<=8&& c-1>0&& i+1<=h&&j-1>0)
        if(tmp(i,j,6)==1&&check(r+1,c-1)==0)       
            m(6)=check_sparse_pixels(r+1,c-1,i+1,j-1,tmp);end
    end
    if(r+1<=8&&         i+1<=h)
        if(tmp(i,j,7)==1&&check(r+1,c)==0)         
            m(7)=check_sparse_pixels(r+1,c,  i+1,j,  tmp);end
    end
    if(r+1<=8&& c+1<=8&&i+1<=h&&j+1<=w)
        if(tmp(i,j,8)==1&&check(r+1,c+1)==0)       
            m(8)=check_sparse_pixels(r+1,c+1,i+1,j+1,tmp);end
    end
    n=sum(m);
end

