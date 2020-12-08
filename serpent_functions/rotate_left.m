function [rotate] = rotate_left (vector,number)
% rotate_left - rotates vector to the left n times
%   Inputs:
%   vector: Binary vector
%   number: Number of times to rotate
%  
%   Output:
%   rotate: Rotated vector
size = length(vector);
for i = 1:number
    
    for m =1:(size-1)
    vector(m)= vector(m+1);
   
    end
    vector(size) = 0;
end
rotate = vector;