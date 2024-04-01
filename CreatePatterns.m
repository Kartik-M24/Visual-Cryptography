%This function creates all the patterns, a 1D cell arrays of 6 patterns (2x2 of uint8 values)
%there are no inputs, so the function simply creates the 6 patterns, assigns them into a cell
%array assigned to 'p' the output.
function p = CreatePatterns()
A = 255*ones(2,2,'uint8'); %A is an array containing 2x2 uint8 values with all four values being 255
A(2,1) = 0; %The value at position 2,1 of A is set to 0
A(2,2) = 0; %The value at position 2,1 of A is set to 0

B = ImageComplement(A); %B is the compliment image of A (i.e. 0,0;255,255), it is made using the
%ImageComplement function

C = 255*ones(2,2,'uint8'); %C is an array containing 2x2 uint8 values with all four values being 255
C(1,1) = 0; %The value at position 1,1 of A is set to 0
C(2,1) = 0; %The value at position 2,1 of A is set to 0

D = ImageComplement(C); %D is the compliment image of C (i.e. 0,0;255,255), it is made using the
%ImageComplement function

E = 255*ones(2,2,'uint8'); %E is an array containing 2x2 uint8 values with all four values being 255
E(1,1) = 0; %The value at position 1,1 of A is set to 0
E(2,2) = 0; %The value at position 2,2 of A is set to 0

F = ImageComplement(E); %F is the compliment image of E (i.e. 0,0;255,255), it is made using the
%ImageComplement function

p = {A,B,C,D,E,F}; %p is a cell array containing the 2x2 arrays assigned to A B C D E F
end

%The image complement function written in lab 7 is referenced
function Y = ImageComplement(x) %the output Y is assigned to the value after x is run through the function
Y = 255 - x; %Y is calculated by subtracting the value of x from 255
end