clear supImg;
supImg = resultImg;

% vertical
for j = 1:mul:(mul*col)
    for i = 1:(mul*row)
        supImg(i, j, :) = [100 100 100];
    end
end

% horizontal
for i = 1:mul:(mul*row)
    for j = 1:(mul*col)
        supImg(i, j, :) = [100 100 100];
    end
end