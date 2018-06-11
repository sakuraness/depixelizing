function [resultImg, vec] = scaling(px, py, borders, input)

%inputX inputY
ix = floor(px); iy = floor(py);
[row, col, d] = size(input);
row = row-1; col = col-1;
%[ix, iy]


%% borders set
% neighbor 4 original pixel
[points, twos] = size(borders);
numBorder = points/2;

%% pixel filling

srcX = floor(px-0.5);
srcY = floor(py-0.5);
six = srcX+0.5;
siy = srcY+0.5;

%from = [px, py]
%target = [six, siy]

% lefttop
if (srcX>=1 && srcY>=1 && srcX<=(row+1) && srcY<=(col+1))
    allow = true;
    p1 = [six, siy]; p2 = [px, py];
    if (p1(1) ~= p2(1) || p1(2) ~= p2(2))
        for i = 1:numBorder
            p3 = [borders(i*2-1, :)];
            p4 = [borders(i*2, :)];
            if (isCross(p1, p2, p3, p4))
                allow = false;
                break;
            end
        end
    end

    if (allow)
        resultImg = input(srcX, srcY, :);
        vec = [0 0 0];
        return;
    end
end

% righttop
if (srcX>=1 && (srcY+1)>=1 && srcX<=(row+1) && (srcY+1)<=(col+1))
    p1 = [six, siy+1]; p2 = [px, py];
    allow = true;
    if (p1(1) ~= p2(1) || p1(2) ~= p2(2))
        for i = 1:numBorder
            p3 = [borders(i*2-1, :)];
            p4 = [borders(i*2, :)];
            if (isCross(p1, p2, p3, p4))
                allow = false;
                break;
            end
        end
    end

    if (allow && (iy+1)<=(col+1))
        resultImg = input(srcX, srcY+1, :);
        vec = [255 255 255];
        return;
    end
end

% leftbot
if ((srcX+1)>=1 && srcY>=1 && (srcX+1)<=(row+1) && srcY<=(col+1))
    p1 = [six+1, siy]; p2 = [px, py];
    allow = true;
    if (p1(1) ~= p2(1) || p1(2) ~= p2(2))
        for i = 1:numBorder
            p3 = [borders(i*2-1, :)];
            p4 = [borders(i*2, :)];
            if (isCross(p1, p2, p3, p4))
                allow = false;
                break;
            end
        end
    end

    if (allow)
        resultImg = input(srcX+1, srcY, :);
        vec = [255 255 0];
        return;
    end
end

% rightbot
if ((srcX+1)>=1 && (srcY+1)>=1 && (srcX+1)<=(row+1) && (srcY+1)<=(col+1))
    allow = true;
    p1 = [six+1, siy+1]; p2 = [px, py];
    if (p1(1) ~= p2(1) || p1(2) ~= p2(2))
        for i = 1:numBorder
            p3 = [borders(i*2-1, :)];
            p4 = [borders(i*2, :)];
            if (isCross(p1, p2, p3, p4))
                allow = false;
                break;
            end
        end
    end

    if (allow)
        resultImg = input(srcX+1, srcY+1, :);
        vec = [0 0 255];
        return;
    end
end

resultImg = input(ix, iy, :);
vec = [120 120 120];

end

