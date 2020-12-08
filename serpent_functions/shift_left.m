function [z] = shift_left(x,y)
% SHIFT_LEFT - shifts to the left an array
%   Inputs:
%   x: array to shift
%   y: number of times to shift
%  
%   Outputs:
%   z: array shifted
a = circshift(x',-y);
z = a.';
end