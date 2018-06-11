function ex = extend(input)

[r, l, h] = size(input);

ex(1, 1, :) = input(1, 1, :);
ex(1, 2, :) = input(1, 1, :);
ex(1, 3:(l+2), :) = input(1, :, :);
ex(1, (l+3), :) = input(1, l, :);
ex(1, (l+4), :) = input(1, l, :);
ex(2, :, :) = ex(1, :, :);

for i = 1:r
    ex((2+i), 1, :) = input(i, 1, :);
    ex((2+i), 2, :) = input(i, 1, :);
    ex((2+i), 3:(l+2), :) = input(i, :, :);
    ex((2+i), (l+3), :) = input(i, l, :);
    ex((2+i), (l+4), :) = input(i, l, :);
end

ex((r+3), 1, :) = input(r, 1, :);
ex((r+3), 2, :) = input(r, 1, :);
ex((r+3), 3:(l+2), :) = input(r, :, :);
ex((r+3), (l+3), :) = input(r, l, :);
ex((r+3), (l+4), :) = input(r, l, :);
ex((r+4), :, :) = ex((r+3), :, :);

end

