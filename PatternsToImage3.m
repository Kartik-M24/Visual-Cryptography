%This function takes in one input the 2D m by n cell array of 2x2 pattern, and converts this into a
%singular image, with all the pixel assigned to a specific position depending on where they are in
%the initial input.
function endresult = PatternsToImage3(image) %assigns endresult as the ouput of the result of the function on the input
[m,n] = size(image); %calculates the number of rows 'm' and columns 'n' in the input
dataPoints1 = zeros(m,n); %creates an array of 0s of size mxn
dataPoints1 = num2cell(dataPoints1); %converts the array 'dataPoints1' to a cell array - a horizontal cell array
dataPoints2 = zeros(m,1); %creates an array of 0s size mx1
dataPoints2 = num2cell(dataPoints2); %comverts the array 'dataPoints2' to a cell array - a vertical cell array
for i = 1:m
    for j = 1:n
        a = image(i,j); %a is assigned to the 2x2 pattern of the image at row i and column j
        dataPoints1(i,j) = a; %this value for a is then places in 'dataPoints1' at row i and column j
    end
    b = horzcat(dataPoints1(i,:)); %after assigning all the values in row i (for all j/column values), all array the values in
    %'dataPoints1' are concatenated horizontally and assigned to b.
    b = cell2mat(b); %b is then converted from each individual cell arrays into an ordinary array
    c = {b}; %b is then stored in a cell array, and assigned to c
    dataPoints2(i,1) = c; %c is then assigned to 'dataPoints2'
end
endresult = vertcat(dataPoints2{:}); %end result is then assigned to 'dataPoints2' which is concatenated vertically (through
%all its points/values)
end
