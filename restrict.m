function out = restrict(img, mul)

[r, l, h] = size(img);
out = img((mul*2+1):(r-mul*2), (mul*2+1):(l-mul*2), :);

end

