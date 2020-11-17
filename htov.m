function [b] = htov (pasar)

hex_str = pasar;
n = length(hex_str); 

bin_str = '';
for h = 1 : n
    bin_str = [bin_str hextovec(hex_str(h))]; %#ok<AGROW>
end
b = str2num(bin_str);