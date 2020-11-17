function z =  generacionllaves (llaves)
permutainicial = xlsread('Permutacioninicial.xlsx');
contador = 3;
w = zeros(141,32);
k = zeros(33,128);

llavefinal = zeros(33,128);
w(8,1:32)= llaves(225:256);
w(7,1:32)= llaves(193:224);
w(6,1:32)= llaves(161:192);
w(5,1:32)= llaves(129:160);
vtoh(w(1+4,1:32))
w(4,1:32)= llaves(97:128);
w(3,1:32)= llaves(65:96);
w(2,1:32)= llaves(33:64);
w(1,1:32)= llaves(1:32);
constante = htov('9E3779B9');
llave = zeros(132,32);
for k = 9:141
j = k-8;
m = k-9;
temporal = xors(w(j,1:32),w(j+3,1:32));
temporal2 = xors(temporal,w(j+5,1:32));
temporal3 = xors(temporal2,w(j+7,1:32));
temporal4 = xors(temporal3,constante);
temporal5 = xors(temporal4,xorse(m));
w(k,1:32) = rotarizquierda(temporal5,11);

end
for i = 9:141
  
llave(i-8,1:32) = cajaS(w(i,1:32),contador);
if (mod((i-8),4) == 0)
contador = contador-1;
end
if (contador < 0)
    contador = 7;
end
end

for i = 1:33
a = i-1; 
k(i,1:128) = horzcat(llave((4*a)+1,1:32),llave((4*a+1)+1,1:32),llave((4*a+2)+1,1:32),llave((4*a+3)+1,1:32));
end
for i = 1:33
llavefinal(i,1:128) = permutar(k(i,1:128),permutainicial);
end
z = llavefinal;
