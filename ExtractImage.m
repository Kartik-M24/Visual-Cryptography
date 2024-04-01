%This function takes in the input 'A' of a RBG image containing the hidden
%encrypted image within, and by going through each pixel of the image and
%determining whether the sum of each pixel across the three layers is even
%or odd accordingly colour the output image. The output image when finished
%will be the hidden encrypted image from the inputted image.
function hidden_black_white_img = ExtractImage(A)
[a,b,c] = size(A); %determines the size of the image (i.e. number of rows, columns and layers)
array = zeros(a,b); %creates an array of zeros with the same number of rows and layers as the
%coloured image (for the black and white hidden image to be decrypted into)
array = uint8(array); %converts this array into a uint8 array
for i = 1:a
    for j = 1:b
        x = A(i,j,1); %x is assigned to the value of the pixel in row i column j of the RGB
        %image in the first layer
        x = double(x); %converts x from uint8 to double so it can be added (if need be to a
        %number greater than 255)
        y = A(i,j,2); %y is assigned to the value of the pixel in row i column j of the RGB
        %image in the second layer
        y = double(y); %converts y from uint8 to double so it can be added (if need be to a
        %number greater than 255)
        z = A(i,j,3); %z is assigned to the value of the pixel in row i column j of the RGB
        %image in the third layer
        z = double(z); %converts z from uint8 to double so it can be added (if need be to a
        %number greater than 255)
        sum = x+y+z; %the sum of the three values
        if mod(sum,2) == 0 %checks to see if the sum is an even number
            array(i,j) = 0; %if so the pixel in the array is made to be a black pixel  at
            %the same positon as the RGB image
        else
            array(i,j) = 255; %otherwise it is made into a white pixel at the same position
            %as the RGB image
        end
    end
end
hidden_black_white_img = array %the output is assigned as the array after finishing the loop
%through all the pixels
end