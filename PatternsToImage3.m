%This function takes in one input the 2D m by n cell array of 2x2 pattern, and converts this into a
%singular image, with all the pixel assigned to a specific position depending on where they are in
%the initial input.
function endresult = PatternsToImage3(image)
[m,n] = size(image);
dataPoints1 = zeros(m,n);
dataPoints1 = num2cell(dataPoints1); %converts the array 'dataPoints1' to a horizontal cell array
dataPoints2 = zeros(m,1);
dataPoints2 = num2cell(dataPoints2); %comverts the array 'dataPoints2' to a vertical cell array
for i = 1:m
    for j = 1:n
        a = image(i,j);
        dataPoints1(i,j) = a;
    end
    b = horzcat(dataPoints1(i,:));
    b = cell2mat(b);
    c = {b};
    dataPoints2(i,1) = c;
end
endresult = vertcat(dataPoints2{:});
end
