%This function is used to encrypt a plain image using a key array of patterns (a cell array
% containing 2x2 patterns), to obtain an encrypted cipher array of patterns (a cell array
% containing 2x2 patterns)
function cipherImage = EncryptImage(image,key) %takes in two inputs the greyscale image and the key
[a,b] = size(image); %determines the size of the image and assigns the number of rows to 'a' and columns to 'b'
array1 = zeros(a,b); %creates an array of 0s of the same size as the image
array1 = num2cell(array1); %converts this array of 0s into a cell array
array2 = zeros(2,2); %creates a second 2x2 array of 0s for the keys
for i = 1:a
    for j = 1:b
        if image(i,j) < 128 %determines if the pixel value in row i of column j is less than 128
            x = cell2mat(key(i,j)); %if it is this point is converted from a cell array to a regular array and is assigned to 'x'
            [y,z] = size(x); %the size of this array is determined, with the number of rows assigned to 'y' and columns to 'z'
            for k = 1:y
                for l = 1:z
                    value = ImageComplement(x(k,l)); %the complement of each pixel in 'x' is found using the predefined function
                    %and this is assigned to 'value
                    array2(k,l) = value; %value is then placed into each cell array in order, until the 2x2 array is full
                end
            end
            array2 = uint8(array2); %this array is then converted into a uint 8 array
            output = {array2}; %before being made a cell array
            array1(i,j) = output; %each individual cell array is then assigned a place in 'array1' until all positions are filled
            %with the new 'array2' values
        end
        if image(i,j) > 127 %if the value of the pixel in image is greater than 127
            value = key(i,j); %then the key at the same position is selected
            array1(i,j) = value; %and assigned into the same position in 'array1'
        end
    end
end
cipherImage = array1; %the final output (cipherImage) is assigned to finished ecnrypted cipher array (array1)
end

