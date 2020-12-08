function [result] = boxes(binary_input,numero)
% Boxes - reads the boxes from the sheet to obtain each value
%   Inputs:
%   binary_input: 128 Bits of plain text to be encrypted
%   numero: Number of the box to claim
%  
%   Outputs:
%   result: Combination of the binary input with result for a certain
%   number
x = vtoh(binary_input);
[~,~,cajas] = xlsread('serpent_boxes/boxes.xlsx');
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
result = s;