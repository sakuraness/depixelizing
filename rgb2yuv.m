function yuv = rgb2yuv(inputImg)

r = inputImg(1, 1, 1);
g = inputImg(1, 1, 2);
b = inputImg(1, 1, 3);
yuv = [0.299*r+0.587*g+0.114*b,-0.169*r-0.331*g+0.5*b+128,0.5*r-0.419*g-0.081*b+128];

end

