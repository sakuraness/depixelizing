[row, col] = size(input);
mul = 4; % multiple times

for i = 1:(row*mul)
    for j = 1:(col*mul)
        px = double(i)/double(mul);
        py = double(j)/double(mul);
        
        resultImg(i, j, :) = scaling(px, py, ctrlPoints, pixelConnect, input);
    end
end