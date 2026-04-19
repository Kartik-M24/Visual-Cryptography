%The function takes in two inputs 'A' a 2D array of uint8 values containing the numbers either
%0 (black) or 255 (white), and 'B' a 3D array of uint8 values containing numbers ranging from 0
%to 255 (inclusive) across the three layers (RGB). Using the specific parameters, pixels in the
%RGB image are altered by one, to embed/hide the grayscale 2D image into the colour image.
function output = EmbedImage(A,B)
[a,b] = size(A);
%[x,y,z] = size(B);
for i = 1:a
    for j = 1:b
        if A(i,j) == 0 
            c =  double(B(i,j,1)) + double(B(i,j,2)) + double(B(i,j,3));
            if mod(c,2) == 1
                B(i,j,1) = AlterByOne(B(i,j,1));
            end
        end
        if A(i,j) == 255 %
            c =  double(B(i,j,1)) + double(B(i,j,2)) + double(B(i,j,3)); 
            if mod(c,2) == 0 
                B(i,j,1) = AlterByOne(B(i,j,1));
            end
        end
    end
end
output = B;
end
