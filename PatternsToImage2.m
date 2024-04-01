function endresult = PatternsToImage2(image) %CHANGE THIS PLEASE DON"T BE DUMB
[m,n] = size(image)                         %WHAT IS HIGHLIGHTED ABOVE
% dataPoints1 = zeros(m,n)                  %DO NOT MISS THIS!!!!!!!!!!!!!
% dataPoints1 = num2cell(dataPoints1)
dataPoints2 = zeros(2*m,2*n)
array1 = zeros(1,2);
array2 = zeros(1,2);

for i = 1:m
    for j = 1:n
        if j == 1 %selects the first image
            image_in_array = image(i,j); %selects an image in order of which they are saved in array of images
            image_in_array = cell2mat(image_in_array); %converts the these images from cell arrays to an oridinary array
            k = 1;
            for l = 1:2
                b =  image_in_array(k,l); %takes the first two components of the array in the top row of the two by two matrix
                array1(k,l) = b; %and saves these values into array 1 positons (1,1) and (1,2)
            end
            o = 2;
            for p = 1:2
                b =  image_in_array(o,p); %takes the second two components of the array in the second row of the two by two matrix
                array2(1,p) = b; %and saves these values into array2 positions (2,1) and (2,2)
            end
            combined_array1 = {array1, array2} %combines the two separated arrays horizontally (array1's two values in one cell array and array2's two values in another cell array)
        end
        if j == 2 %selects the second image
            image_in_array = image(i,j);
            image_in_array = cell2mat(image_in_array);
            k = 1;
            for l = 1:2
                b =  image_in_array(k,l);
                array1(k,l) = b;
            end
            o = 2;
            for p = 1:2
                b =  image_in_array(o,p);
                array2(1,p) = b;
            end
            combined_array2 = {array1, array2}
        end
        if j == 3 %selects the third image
            image_in_array = image(i,j);
            image_in_array = cell2mat(image_in_array);
            k = 1;
            for l = 1:2
                b =  image_in_array(k,l);
                array1(k,l) = b;
            end
            o = 2;
            for p = 1:2
                b =  image_in_array(o,p);
                array2(1,p) = b;
            end
            combined_array3 = {array1, array2}
        end
    end
end

for y = 1
    for z = 1:2
        delta = combined_array1(1,1)
        delta = cell2mat(delta)
        b =  delta(y,z)
        dataPoints2(y,z) = b
    end
end

delta = combined_array1(1,2)
delta = cell2mat(delta)
b =  delta(1,1)
dataPoints2(2,1) = b

delta = combined_array1(1,2)
delta = cell2mat(delta)
b =  delta(1,2)
dataPoints2(2,2) = b

for y = 1
    for z = 1:2
        delta = combined_array2(y,z)
        delta = cell2mat(delta)
        b =  delta(y,z)
        dataPoints2(y,z) = b
    end
end

for y = 1
    for z = 1:2
        delta = combined_array3(y,z)
        delta = cell2mat(delta)
        b =  delta(y,z)
        dataPoints2(y,z) = b
    end
end

dataPoints2 = uint8(dataPoints2)
endresult = dataPoints2
end