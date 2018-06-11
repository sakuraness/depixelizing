[r, l, k] = size(input);

for i = 1:(r+2)
    outputImg(i, 1, :) = [255 255 255];
    outputImg(i, (l+2), :) = [255 255 255];
end

for j = 1:(l+2)
    outputImg(1, j, :) = [255 255 255];
    outputImg((r+2), j, :) = [255 255 255];
end

outputImg(2:(r+1),2:(l+1) , :) = input;