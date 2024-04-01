%This function takes in two inputs, A - a 2D mxn array of containing randomer numbers between 1 and 6
%(inclusive) and p - a 1x6 1D array containing the patterns (where each pattern is stored as a 2x2 (uint8 array)
%Based off the randomly generated numbers in A, a pattern is selected from p and assigned to dataPoint which is
%assigned to the output 'key'.
function key  = GenerateKey(A,p) %assigns key as the ouput of the result of the function on the inputs
[m,n] = size(A); %calculates the number of rows 'm' and columns 'n' in the input 'A'
dataPoints = zeros(m,n); %creates an array of 0s of size mxn
dataPoints = num2cell(dataPoints); %converts the array 'dataPoints1' to a cell array
for i = 1:m
    for j = 1:n
        a = A(i,j); %a is assigned as the number value at point (i,j) of input 'A'
        k = p(a); %k is then assigned as the pattern value in the array 'p' at point 'a'
        dataPoints(i,j) = k; %this assigns the point k into dataPoints point (i,j)
    end
end
key = dataPoints; %after all values in the dataPoints is assigned, the output key is assigned to key
end