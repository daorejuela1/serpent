function combination = serpent_encrypt(plain_text, key)
% SERPENT_ENCRYPT  Encrypts plain text by using a key and combination boxes
%   Inputs:
%   plain_text: 128 Bits of plain text to be encrypted
%   key: 256 key used for encryption
%  
%   Outputs:
%   combination: Result of the encrypted plain_text
input_bin = htov(plain_text);
init_perm = xlsread('serpent_boxes/initial_perm.xlsx');
final_perm = xlsread('serpent_boxes/final_perm.xlsx');
%%%%Initial permutation
%%%%%%%%%%%%%%%%%%%%%%%%%%BLOQUE DE SUMA DE KI CON LA PERMUTACION%%%%%%%%%%
output_text = permutate(input_bin, init_perm);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Key expansion%%%%%%%%%%%%%%%%%%%%%%
keys = expand_keys(htov(key));
%Starting round count
%31 Round realized
for m = 1:31
   i = m-1;
   i = mod(i,8) ;
   output_text = transflineal(output_text,keys,i,m);
end
temp = xors(output_text, keys(32,1:128)); 
container = boxes(temp,7);
result = xors(container, keys(33,1:128));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PERMUTA FINAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
encryption = permutate(result, final_perm);
combination = vtoh(encryption);