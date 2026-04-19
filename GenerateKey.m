%This function takes in two inputs, A - a 2D mxn array of containing randomer numbers between 1 and 6
%(inclusive) and p - a 1x6 1D array containing the patterns (where each pattern is stored as a 2x2 (uint8 array)
%Based off the randomly generated numbers in A, a pattern is selected from p and assigned to dataPoint which is
%assigned to the output 'key'.
function key  = GenerateKey(A,p)
[m,n] = size(A);
dataPoints = zeros(m,n);
dataPoints = num2cell(dataPoints);
for i = 1:m
    for j = 1:n
        a = A(i,j);
        k = p(a);
        dataPoints(i,j) = k;
    end
end
key = dataPoints;
end
