function [z] = desplazarizq (vector,numero)
%Esta función suma dos números x e y
size = length(vector);
for i = 1:numero
    
    for m =1:(size-1)
    vector(m)= vector(m+1);
   
    end
    vector(size) = 0;
end
z = vector;