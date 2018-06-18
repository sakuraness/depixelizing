%main script of the project
%simply run and get the result
%the size of result is [height,width,8]
%the "8-bits" represents the pixel connect with its neighbors or not.
%{
each number represent a neighbor
1 2 3
4 c 5
6 7 8
%}
clear;

mul = 16; % multiple times

% load the input and extend it
input = imread('testcase/test10.png');
input = extend(input);

% connection of input pixels about their neighbors
pixelConnect = step_one(input);

makeCtrlPoints;

% main scaling function
multiple;

% generate support line with ctrlPoints & borders
blockLine;
showCP;

[resultImg, smImg] = smooth(resultImg);

% cut off the border
resultImg = restrict(resultImg, mul);
supImg = restrict(supImg, mul);
smImg = restrict(smImg, mul);

% output the result
imwrite(resultImg, 'output/output10.png');
imwrite(supImg, 'output/sup10.png');
imwrite(smImg, 'output/sm10.png');