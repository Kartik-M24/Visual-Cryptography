%This function takes in two inputs, the cipher image 'A' and the key image
%'B', using these two images, it goes through each of the pixels in both
%images and depending the values of the pixels, assigns a value to the
%array. These process is repeated for all pixels in in the key image 'B'
% if the key image is the same size then this is done for all the pixels if
% it is smaller then this is only done for pixels that overlap between the
% key and the cipher image, to produce the decrypted image 'final_img'
function final_img = DecryptImage(A,B)
[a,b] = size(A); %determines the number of rows 'a' and columns 'b' in image 'A'
[c,d] = size(B); %determines the number of rows 'c' and columns 'd' in image 'B'
array = zeros(c,d); %makes an array of the same size as the key image
array = uint8(array); %converts this array into a uint8 array
for i = 1:a %goes through all rows
    for j = 1:b %and goes through all columns
        if i <= c %checks to see that the value of i is not greater than the number of rows in 'B'
            if j <= d %checks to see that the value of j is not greater than the number of columns in 'B'
                x = A(i,j); %x is assigned to the value of the pixel in row i column j of image 'A'
                y = B(i,j); %y is assigned to the value of the pixel in row i column j of image 'B'
                %the following if statements check to see if x and y values have certain paried values if
                %this is the case, the value of the pixel in the array is assigned a number (either 0 or
                % 255) depending on the values of x and y
                if x == 255 & y == 255
                    array(i,j) = 255;
                elseif x == 0 & y == 0
                    array(i,j) = 255;
                elseif x == 255 & y == 0
                    array(i,j) = 0;
                else
                    array(i,j) = 0;
                end
            end
        end
    end
end
final_img = array %the 'final_img' output is assigned to the completed array (after going through the loop)
end