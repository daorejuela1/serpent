function [textodesalida] = permutar (textodeentrada,permutainicial)
textodesalida = zeros(1,128);
for index = 1:8
    for perm = 1:16
        textodesalida((permutainicial(perm,index*2)+1)) = textodeentrada((permutainicial(perm,2*(index-1)+1)+1));
    end
end