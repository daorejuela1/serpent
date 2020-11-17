function [z] = cajaS (a,numero)
x = vtoh(a);
[basurar,basura,cajas] = xlsread('cajas.xlsx');
containsNumbers = cellfun(@isnumeric,cajas);
cajas(containsNumbers) = cellfun(@num2str,cajas(containsNumbers),'UniformOutput',false);
n =16+16*numero;
size = length(x);
for m = 1:size
    for i = 1:16
        if (strcmp(cajas(i),x(m)))
            x(m) = cell2mat(cajas(n+i));
            break
        end
    end
end
s = htov(x);
z = s;