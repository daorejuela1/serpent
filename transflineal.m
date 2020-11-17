function [z] = transflineal (vector,llave,caja,numllave)
%COMENZAMOS LA LT
temporal = xors(vector,llave(numllave,1:128)); 
contenedor = cajaS(temporal,caja);
 X0 = contenedor(97:128);
 X1 = contenedor(65:96);
 X2 = contenedor(33:64);
 X3 = contenedor(1:32);
X0 = rotarizquierda(X0,13);
X2 = rotarizquierda(X2,3);
temporal = xors(X0,X1);
X1 = xors(temporal,X2);
temporal = xors(X3,X2);
X3 = xors(temporal,(desplazarizq(X0,3)));
X1 = rotarizquierda(X1,1);
X3 = rotarizquierda(X3,7);
temporal = xors(X0,X1);
X0 = xors(temporal,X3);
temporal = xors(X2,X3);
X2 = xors(temporal,(desplazarizq(X1,7)));
X0 = rotarizquierda(X0,5);
X2 = rotarizquierda(X2,22);
%concatenamos el resultado de la transformación lineal
SALIDARONDA = horzcat(X3,X2,X1,X0);
disp('resultadoronda1')
z = SALIDARONDA