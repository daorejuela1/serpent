function [z] = shift_right(x,y)
% SHIFT_RIGHT - shifts to the right an array
%   Inputs:
%   x: array to shift
%   y: number of times to shift
%  
%   Outputs:
%   z: array shifted
a = circshift(x',y);
z = a.';
end