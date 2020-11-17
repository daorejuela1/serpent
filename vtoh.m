function [h] = vtoh (vector)
vector = mat2str(vector);
size = length(vector);
pasar = vector(2:(size-1));
pasar=strrep(pasar,' ','');
bin_str = pasar;
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
h =hex_str;
