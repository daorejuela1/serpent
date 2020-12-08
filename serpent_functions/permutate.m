function [output_text] = permutate (input_text,init_perm)
% PERMUTATE - permutates the input value with the binary in the boxes
%   Inputs:
%   input_text: 128 Bits of plain text to be encrypted
%   init_perm: value of the perm to perform
%  
%   Outputs:
%   output_text: permutated input
output_text = zeros(1,128);
for index = 1:8
    for perm = 1:16
        output_text((init_perm(perm,index*2)+1)) = input_text((init_perm(perm,2*(index-1)+1)+1));
    end
end