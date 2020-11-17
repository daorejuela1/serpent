function [c] = xors (a,b)
n = length(a);
m = zeros(1,n);
for i = 1:n
m(i) = xor(a(i),b(i)); 
end
c = m;