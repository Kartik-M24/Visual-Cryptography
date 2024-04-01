function Y = AlterByOne(x)
x == uint8(x)
if x<255
    x = x+1;
else
    x = x-1;
end
Y = x;