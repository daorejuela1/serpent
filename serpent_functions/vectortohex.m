function [hex_output] = vectortohex (vec_inpt)
% VECTORTOHEX  Converts vect representation to hext
%   Inputs:
%   vec_inpt: Vec input
%
%   Outputs:number
%   hex_output: hex representation of vect
 
switch vec_inpt
    case {'0', '00', '000', '0000'}
        hex_output = '0';
    case {'1', '01', '001', '0001'}
        hex_output = '1';
    case {'10', '010', '0010'}
        hex_output = '2';
    case {'11', '011', '0011'}
        hex_output = '3';
    case {'100', '0100'}
        hex_output = '4';
    case {'101', '0101'}
        hex_output = '5';
    case {'110', '0110'}
        hex_output = '6';
    case {'111', '0111'}
        hex_output = '7';
    case '1000'
        hex_output = '8';
    case '1001'
        hex_output = '9';
    case '1010'
        hex_output = 'A';
    case '1011'
        hex_output = 'B';
    case '1100'
        hex_output = 'C';
    case '1101'
        hex_output = 'D';
    case '1110'
        hex_output = 'E';
    case '1111'
        hex_output = 'F';
 otherwise
           hex_output = 'X';
end