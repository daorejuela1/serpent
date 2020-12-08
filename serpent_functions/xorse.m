function [vector] = xorse (number)
% XORSE  Converts the original number to hex
%   Inputs:
%   number: First vector
%   Output: 
%   vector: num converted to vector
number = dec2hex(number,8);
vector = htov(number);


