[r, l, d] = size(ctrlPoints);
[points, twos] = size(borders);
numBorder = points/2;

for k = 1:numBorder
    p1 = borders(k*2-1, :);
    p2 = borders(k*2, :);
    
    if (p1(1) == 0) continue; end
    
    p1 = [round((p1(1)-1)*mul)+1, round((p1(2)-1)*mul)+1];
    p2 = [round((p2(1)-1)*mul)+1, round((p2(2)-1)*mul)+1];
    
    lx = abs(p1(1)-p2(1));
    ly = abs(p1(2)-p2(2));
    
    if (lx >= ly)
        if (p1(1)>=p2(1))
            lp1 = p2; lp2 = p1;
        else
            lp1 = p1; lp2 = p2;
        end
        
        for i = lp1(1):lp2(1)
            ratio = (i-lp1(1))/(lp2(1)-lp1(1));
            j = round(lp2(2)*ratio + lp1(2)*(1-ratio));
            
            if (i<0 || j<0) break; end
            
            supImg(i, j, :) = [200 200 50];
        end
    else
        if (p1(2)>=p2(2))
            lp1 = p2; lp2 = p1;
        else
            lp1 = p1; lp2 = p2;
        end
        
        for j = p1(2):p2(2)
            ratio = (j-lp1(2))/(lp2(2)-lp1(2));
            i = round(lp2(1)*ratio + lp1(1)*(1-ratio));
            
            if (i<0 || j<0) break; end
            
            supImg(i, j, :) = [200 200 50];
        end
    end
end

for i = 1:r
    for j = 1:l
        if (ctrlPoints(i, j, 1) == 0)
            % do nothing
        elseif (ctrlPoints(i, j, 1) == 1)
            supImg(round((ctrlPoints(i, j, 2)-1)*mul)+1, round((ctrlPoints(i, j, 3)-1)*mul)+1, :) = [50 50 50];
        elseif (ctrlPoints(i, j, 1) == 2)
            supImg(round((ctrlPoints(i, j, 2)-1)*mul)+1, round((ctrlPoints(i, j, 3)-1)*mul)+1, :) = [50 50 50];
            supImg(round((ctrlPoints(i, j, 4)-1)*mul)+1, round((ctrlPoints(i, j, 5)-1)*mul)+1, :) = [50 50 50];
        end
    end
end