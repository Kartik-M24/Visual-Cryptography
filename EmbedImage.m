%The function takes in two inputs 'A' a 2D array of uint8 values containing the numbers either
%0 (black) or 255 (white), and 'B' a 3D array of uint8 values containing numbers ranging from 0
%to 255 (inclusive) across the three layers (RGB). Using the specific parameters, pixels in the
%RGB image are altered by one, to embed/hide the grayscale 2D image into the colour image.
function output = EmbedImage(A,B) %output is assigned to the result of running the function on the two inputs
[a,b] = size(A); %calculates the number of rows 'a' and columns 'b' in input 'A'
%[x,y,z] = size(B);
for i = 1:a
    for j = 1:b
        if A(i,j) == 0 %checks the value at the point (i,j) of the input 'A', to see if it is 0, if so it continues through
            %the following indented code, else it skips to the next statement
            c =  double(B(i,j,1)) + double(B(i,j,2)) + double(B(i,j,3)); %calculates the sum of the points (i,j) across
            %all three layers of input 'B', making sure to convert all three values from uint8 to double, so that the
            %sum can exceed 255 if larger than 255, this sum is then assigned to 'c'
            if mod(c,2) == 1 %if c is an odd number, then when the modulus is taken by 2, it's remainder will be 1
                %B(i,j,1) = B(i,j,1) + 1;
                B(i,j,1) = AlterByOne(B(i,j,1)); %if this is the case, than the point (i,j) in layer 1 (the red layer) of B
                %will be run through the AlterByOne function, changing it's value by 1 if it is between 0 and 255, and
                %reducing it by one if the value at this point is 255
            end
        end
        if A(i,j) == 255 %checks the value at point (i,j) of the input 'A', to see if it is 255, if so it continues through
            %the following indented code
            c =  double(B(i,j,1)) + double(B(i,j,2)) + double(B(i,j,3)); %calculates the sum of the points (i,j) across
            %all three layers of input 'B', making sure to convert all three values from uint8 to double, so that the
            %sum can exceed 255 if larger than 255, this sum is then assigned to 'c'
            if mod(c,2) == 0 %if c is an even number, then when the modulus is taken by 2, it's remainder will be 0
                %B(i,j,1) = B(i,j,1) + 1;
                B(i,j,1) = AlterByOne(B(i,j,1));  %if this is the case, than the point (i,j) in layer 1 (the red layer) of B
                %will be run through the AlterByOne function, changing it's value by 1 if it is between 0 and 255, and
                %reducing it by one if the value at this point is 255
            end
        end
    end
end
output = B; %output is assigned to the new image/3D array 'B' with the changed pixel values
end
