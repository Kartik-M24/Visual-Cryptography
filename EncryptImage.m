%This function is used to encrypt a plain image using a key array of patterns (a cell array
% containing 2x2 patterns), to obtain an encrypted cipher array of patterns (a cell array
% containing 2x2 patterns)
function cipherImage = EncryptImage(image,key) %takes in two inputs the greyscale image and the key
[a,b] = size(image);
array1 = zeros(a,b);
array1 = num2cell(array1);
array2 = zeros(2,2);
for i = 1:a
    for j = 1:b
        if image(i,j) < 128 
            x = cell2mat(key(i,j));
            [y,z] = size(x);
            for k = 1:y
                for l = 1:z
                    value = ImageComplement(x(k,l));
                    array2(k,l) = value; %value is then placed into each cell array in order, until the 2x2 array is full
                end
            end
            array2 = uint8(array2);
            output = {array2};
            array1(i,j) = output;
        end
        if image(i,j) > 127
            value = key(i,j);
            array1(i,j) = value;
        end
    end
end
cipherImage = array1;
end

