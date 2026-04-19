%This function takes in the input 'A' of a RBG image containing the hidden
%encrypted image within, and by going through each pixel of the image and
%determining whether the sum of each pixel across the three layers is even
%or odd accordingly colour the output image. The output image when finished
%will be the hidden encrypted image from the inputted image.
function hidden_black_white_img = ExtractImage(A)
[a,b,c] = size(A);
array = zeros(a,b);
array = uint8(array);
for i = 1:a
    for j = 1:b
        x = A(i,j,1);
        x = double(x);
        y = A(i,j,2);
        y = double(y);
        z = A(i,j,3);
        z = double(z);
        sum = x+y+z;
        if mod(sum,2) == 0
            array(i,j) = 0;
        else
            array(i,j) = 255; 
        end
    end
end
hidden_black_white_img = array
end
