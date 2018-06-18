function [outputImg, smImg] = smooth(inputImg)

[r, l, k] = size(inputImg);

outputImg = inputImg;

for t = 1:10 % smooth width
    t
    for i = 1:r
        for j = 1:l
            yuv(i, j, :) = rgb2yuv(outputImg(i, j, :));
        end
    end
    
    for i = 2:(r-1)
        for j = 2:(l-1)
            center = yuv(i, j, :);
            top = yuv(i-1, j, :); bot = yuv(i+1, j, :);
            left = yuv(i, j-1, :); right = yuv(i, j+1, :);
            
            relation = [
                isClose(center, top),
                isClose(center, bot),
                isClose(center, left),
                isClose(center, right)
            ];
            
            
            smImg(i, j, :) = [0 0 0];
            
            % case works
            if (sum(relation) == 4)
                % mix
                d_top = double(outputImg(i-1, j, :));
                d_bot = double(outputImg(i+1, j, :));
                d_left = double(outputImg(i, j-1, :));
                d_right = double(outputImg(i, j+1, :));
                outputImg(i, j, :) = uint8((d_top+d_bot+d_left+d_right)/4);
                smImg(i, j, :) = [255 255 255];
            end
            
            %{
            % case works
            if (sum(relation) == 0)
                % do nothing
            elseif (sum(relation) == 1)
                % do nothing
            elseif (sum(relation) == 2)
                if ((relation(1)+relation(2)) == 2 || (relation(3)+relation(4)) == 2)
                    % straight
                    % do nothing
                else
                    % mix
                    d_top = double(inputImg(i-1, j, :));
                    d_bot = double(inputImg(i+1, j, :));
                    d_left = double(inputImg(i, j-1, :));
                    d_right = double(inputImg(i, j+1, :));
                    outputImg(i, j, :) = uint8((d_top+d_bot+d_left+d_right)/4);
                    sm = [i, j]
                end
            elseif (sum(relation) == 3)
                % mix
                d_top = double(inputImg(i-1, j, :));
                d_bot = double(inputImg(i+1, j, :));
                d_left = double(inputImg(i, j-1, :));
                d_right = double(inputImg(i, j+1, :));
                outputImg(i, j, :) = uint8((d_top+d_bot+d_left+d_right)/4);
                sm = [i, j]
            elseif (sum(relation) == 4)
                % do nothing
            end
            %}
        end
    end
end

end

