function expanded_key =  expand_keys(keys)
% EXPAND_KEYS  expand keys for 32 iterations by getting one key
%   Inputs:
%   keys: 256 Bits key used for encryption
%
%   Outputs:
%   expanded_key: Expanded conjuctions of keys
init_perm = xlsread('serpent_boxes/initial_perm.xlsx');
counter = 3;
w = zeros(141,32);
k = zeros(33,128);
llavefinal = zeros(33,128);
w(8,1:32)= keys(225:256);
w(7,1:32)= keys(193:224);
w(6,1:32)= keys(161:192);
w(5,1:32)= keys(129:160);
w(4,1:32)= keys(97:128);
w(3,1:32)= keys(65:96);
w(2,1:32)= keys(33:64);
w(1,1:32)= keys(1:32);
constant = htov('9E3779B9');
key = zeros(132,32);
for k = 9:141
    j = k-8;
    m = k-9;
    temp1 = xors(w(j,1:32),w(j+3,1:32));
    temp2 = xors(temp1,w(j+5,1:32));
    temp3 = xors(temp2,w(j+7,1:32));
    temp4 = xors(temp3,constant);
    temp5 = xors(temp4,xorse(m));
    w(k,1:32) = shift_left(temp5,11);
    
end
for i = 9:141
    
    key(i-8,1:32) = boxes(w(i,1:32),counter);
    if (mod((i-8),4) == 0)
        counter = counter-1;
    end
    if (counter < 0)
        counter = 7;
    end
end

for i = 1:33
    a = i-1;
    k(i,1:128) = horzcat(key((4*a)+1,1:32),key((4*a+1)+1,1:32),key((4*a+2)+1,1:32),key((4*a+3)+1,1:32));
end
for i = 1:33
    llavefinal(i,1:128) = permutate(k(i,1:128),init_perm);
end
expanded_key = llavefinal;
