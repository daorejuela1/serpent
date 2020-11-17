clc;
clear;

textodeentrada = htov('B31FDE105462CFE3CCD2DC2197230568');
llave = htov('8000000000000000000000000000000029ABEF21A93ED0F42340ED32A87D1679');
permutainicial = xlsread('Permutacioninicial.xlsx');
permutafinal = xlsread('Permutacionfinal.xlsx');
%Se comienza a realizar la permutación inicial
%Se debe considerar que a cada elemento de la tabla se le suma una unidad
%Para adecuar la tabla a la indexación de matlab
%Para cada pareja de bits de entrada y salida
%%%%PERMUTACION INICIAL CORRECTA¦|
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%BLOQUE DE SUMA DE KI CON LA PERMUTACION%%%%%%%%%%%%%%%%%%%%%%%%%%
textodesalida = permutar(textodeentrada,permutainicial);
vtoh(textodesalida)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TRANSFORMACION LINEAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
llaves = generacionllaves(llave);
%COMIENZAN LAS RONDAS

%SE HACEN 31 RONDAS 
for m = 1:31
 i = m-1;
 i = mod(i,8) ;
textodesalida = transflineal(textodesalida,llaves,i,m);
end
temporal = xors(textodesalida,llaves(32,1:128)); 
contenedor = cajaS(temporal,7);
resultado = xors(contenedor,llaves(33,1:128));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PERMUTA FINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
encriptado = permutar(resultado,permutafinal);
vtoh(encriptado)
