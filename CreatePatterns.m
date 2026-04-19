%This function creates all the patterns, a 1D cell arrays of 6 patterns (2x2 of uint8 values)
function p = CreatePatterns()
A = 255*ones(2,2,'uint8');
A(2,1) = 0;
A(2,2) = 0;

B = ImageComplement(A); %B is the compliment image of A (i.e. 0,0;255,255)

C = 255*ones(2,2,'uint8'); %C is an array containing 2x2 uint8 values with all four values being 255
C(1,1) = 0;
C(2,1) = 0;

D = ImageComplement(C);

E = 255*ones(2,2,'uint8');
E(1,1) = 0;
E(2,2) = 0;

F = ImageComplement(E);

p = {A,B,C,D,E,F}; %p is a cell array containing the 2x2 arrays assigned to A B C D E F
end

function Y = ImageComplement(x)
Y = 255 - x;
end
