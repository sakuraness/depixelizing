function resultImg = scaling(px, py, ctrlPoints, pixelConnect, input)

ix = floor(px); iy = floor(py); %inputX inputY

lefttopCP = ctrlPoints(ix-1, iy-1, :);
righttopCP = ctrlPoints(ix, iy-1, :);
leftbotCP = ctrlPoints(ix-1, iy, :);
rightbotCP = ctrlPoints(ix, iy, :);


borders = []; % 2 points denote a border

% top border
if (~pixelConnect(ix, iy, 2))
    % may set border
    if (lefttopCP(1) == 0 || righttopCP(1) == 0)
        % do not set
    elseif (lefttopCP(1) == 1 && righttopCP(1) == 1)
        % simple border
        borders = [borders; lefttopCP(2), lefttopCP(3); righttopCP(2), righttopCP(3)];
    else
        % find the center point of 2
        if (lefttopCP(1) == 2)
            if (lefttopCP(2) > lefttopCP(4))
                p1 = [lefttopCP(2), lefttopCP(3)];
            else
                p1 = [lefttopCP(4), lefttopCP(5)];
            end
        else
            p1 = [lefttopCP(2), lefttopCP(3)];
        end
        
        if (righttopCP(1) == 2)
            if (righttopCP(2) < righttopCP(4))
                p2 = [righttopCP(2), righttopCP(3)];
            else
                p2 = [righttopCP(4), righttopCP(5)];
            end
        else
            p2 = [righttopCP(2), righttopCP(3)];
        end
        
        borders = [borders; p1; p2];
    end
end

% bot border
if (~pixelConnect(ix, iy, 7))
    % may set border
    if (leftbotCP(1) == 0 || rightbotCP(1) == 0)
        % do not set
    elseif (leftbotCP(1) == 1 && rightbotCP(1) == 1)
        % simple border
        borders = [borders; leftbotCP(2), leftbotCP(3); rightbotCP(2), rightbotCP(3)];
    else
        % find the center point of 2
        if (leftbotCP(1) == 2)
            if (leftbotCP(2) > leftbotCP(4))
                p1 = [leftbotCP(2), leftbotCP(3)];
            else
                p1 = [leftbotCP(4), leftbotCP(5)];
            end
        else
            p1 = [leftbotCP(2), leftbotCP(3)];
        end
        
        if (rightbotCP(1) == 2)
            if (rightbotCP(2) < rightbotCP(4))
                p2 = [rightbotCP(2), rightbotCP(3)];
            else
                p2 = [rightbotCP(4), rightbotCP(5)];
            end
        else
            p2 = [rightbotCP(2), rightbotCP(3)];
        end
        
        borders = [borders; p1; p2];
    end
end
    
    
    
end

