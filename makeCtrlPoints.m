[row, col, dir] = size(pixelConnect);

for i = 1:(row-1)
    for j = 1:(col-1)
        % for every 2*2 original pixels
        ctrlPoints(i, j, :) = genCtrlPoints(pixelConnect(i:(i+1),j:(j+1) , :), i, j);
    end
end