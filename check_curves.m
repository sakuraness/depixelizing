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
        n=1;
        if(sum(tmp(i,j,:))<=2)
            for k=1:8
                if(k==from),continue;
                else
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
        end
    end
end

