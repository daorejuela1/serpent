function [hex] = vtoh (vector)
% VTOH  Convert from hex to vect
%   Inputs:
%   vector: Vector to be converted
%
%   Outputs:
%   h: hex representation of number
vector = mat2str(vector);
size = length(vector);
pass = vector(2:(size-1));
pass=strrep(pass,' ','');
bin_str = pass;
i = length(bin_str);
n = ceil(i/4); 

for g = n : -1 : 1
    if i > 4
        hex_str(g) = vectortohex(bin_str(i-3 : i));
        i = i - 4;
    else
        hex_str(g) = vectortohex(bin_str(1 : i));
    end
end
hex =hex_str;
