function [c] = xors (a,b)
% XORS  Xor operation with vectors
%   Inputs:
%   a: First vector
%   b: Second vector
%   Outputs:number
%   c: Result of the xor operation
n = length(a);
m = zeros(1,n);
for i = 1:n
m(i) = xor(a(i),b(i)); 
end
c = m;