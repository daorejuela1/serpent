function [output] = hextovec (hex_num)
% HEXTOVEC  Convert from hex to vect
%   Inputs:
%   hex_num: Hex number to be converted to vect
%
%   Outputs:
%   output: vect representation of number
switch hex_num
    case {'0'}
        output = '0 0 0 0 ';
    case {'1'}
        output = '0 0 0 1 ';
    case {'2'}
        output = '0 0 1 0 ';
    case {'3'}
        output = '0 0 1 1 ';
    case {'4'}
        output = '0 1 0 0 ';
    case {'5'}
        output = '0 1 0 1 ';
    case {'6'}
        output = '0 1 1 0 ';
    case {'7'}
        output = '0 1 1 1 ';
    case {'8'}
        output = '1 0 0 0 ';
    case {'9'}
        output = '1 0 0  1 ';
    case {'A', 'a'}
        output = '1 0 1 0 ';
    case {'B', 'b'}
        output = '1 0 1 1 ';
    case {'C', 'c'}
        output = '1 1 0 0 ';
    case {'D', 'd'}
        output = '1 1 0 1 ';
    case {'E', 'e'}
        output = '1 1 1 0 ';
    case {'F', 'f'}
        output = '1 1 1 1 ';
end