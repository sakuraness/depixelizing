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
input=imread('testcase/test1.png');
%result is save in "test" variable
test=step_one(input); 