function [output] = htov (hex_num)
% HTOV  Convert from hex to vect
%   Inputs:
%   hex_num: Hex number to be converted to vect
%
%   Outputs:
%   output: vector representation in binary
hex_str = hex_num;
n = length(hex_str); 

bin_str = '';
for h = 1 : n
    bin_str = [bin_str hextovec(hex_str(h))]; %#ok<AGROW>
end
output = str2num(bin_str);