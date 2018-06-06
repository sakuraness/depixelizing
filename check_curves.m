%{
    tmp,output
    1 2 3
    4 x 5
    6 7 8
    points
    1 2
    3 4
%}
function n = check_curves(i,j,tmp,from)
    global check;
    check(i,j)=1;
    if(from==0)
        n=0;
        if(sum(tmp(i,j,:))<=2)
            for k=1:8
                if    (tmp(i,j,k)==1&&k==1),n=n+check_curves(i-1,   j-1,   tmp,8);
                elseif(tmp(i,j,k)==1&&k==2),n=n+check_curves(i-1,   j,     tmp,7);
                elseif(tmp(i,j,k)==1&&k==3),n=n+check_curves(i-1,   j+1,   tmp,6);
                elseif(tmp(i,j,k)==1&&k==4),n=n+check_curves(i,     j-1,   tmp,5);
                elseif(tmp(i,j,k)==1&&k==5),n=n+check_curves(i,     j+1,   tmp,4);
                elseif(tmp(i,j,k)==1&&k==6),n=n+check_curves(i+1,   j-1,   tmp,3);
                elseif(tmp(i,j,k)==1&&k==7),n=n+check_curves(i+1,   j,     tmp,2);
                elseif(tmp(i,j,k)==1&&k==8),n=n+check_curves(i+1,   j+1,   tmp,1);
                end
            end
        end
    else    
        if(sum(tmp(i,j,:))<=2)
            n=1;
            for k=1:8
                if(k==from),continue;
                else
                    if    (tmp(i,j,k)==1&&k==1)
                        if(check(i-1,j-1)==0),n=n+check_curves(i-1,   j-1,   tmp,8);end
                    elseif(tmp(i,j,k)==1&&k==2)
                        if(check(i-1,j  )==0),n=n+check_curves(i-1,   j,     tmp,7);end
                    elseif(tmp(i,j,k)==1&&k==3)
                        if(check(i-1,j+1)==0),n=n+check_curves(i-1,   j+1,   tmp,6);end
                    elseif(tmp(i,j,k)==1&&k==4)
                        if(check(i,  j-1)==0),n=n+check_curves(i,     j-1,   tmp,5);end
                    elseif(tmp(i,j,k)==1&&k==5)
                        if(check(i,  j+1)==0),n=n+check_curves(i,     j+1,   tmp,4);end
                    elseif(tmp(i,j,k)==1&&k==6)
                        if(check(i+1,j-1)==0),n=n+check_curves(i+1,   j-1,   tmp,3);end
                    elseif(tmp(i,j,k)==1&&k==7)
                        if(check(i+1,j  )==0),n=n+check_curves(i+1,   j,     tmp,2);end
                    elseif(tmp(i,j,k)==1&&k==8)
                        if(check(i+1,j+1)==0),n=n+check_curves(i+1,   j+1,   tmp,1);end
                    end
                end
            end
        else
            n=0;
        end  
    end
end

