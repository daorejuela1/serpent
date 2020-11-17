function [z] = rotarizquierda(x,y)
%a = vector, y = cantidad de veces que se va a rotar a la izquierda.
a = circshift(x',-y);
z = a.';
end