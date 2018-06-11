[row, col, dd] = size(input);

borders = setBorder(ctrlPoints);

for i = 1:(row*mul)
    for j = 1:(col*mul)
        px = (double(i)-1.0)/double(mul)+1;
        py = (double(j)-1.0)/double(mul)+1;
        
        [resultImg(i, j, :), vec(i, j, :)] = scaling(px, py, borders, input);
        
    end
end

