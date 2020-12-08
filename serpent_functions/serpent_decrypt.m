function plain_text = serpent_decrypt(combination, key)
% SERPENT_DECRYPT  Decrypts the combination using a key and boxes
%   Inputs:
%   combination: Result of the encrypted plain_text
%   key: 256 key used for encryption
%  
%   Outputs:
%   combination: 128 Bits of plain text to be encrypted
init_perm = xlsread('/serpent_boxes/initial_perm.xlsx');
final_perm = xlsread('/serpent_boxes/final_perm.xlsx');
keys = expand_keys(htov(key));
descipher_input = permutate(htov(combination), init_perm);
descipher = xors(descipher_input, keys(33,1:128));
temp2 = invert_boxes(descipher, 7);
descipher = xors(temp2, keys(32,1:128));
for h = 1:31
    i = mod(31-h,8);
    Idej = transflinealinver(descipher);
    descipher = invert_boxes(Idej,i);
    descipher = xors(descipher,keys(32-h,1:128));
end
descipher = permutate(descipher,final_perm);
plain_text = vtoh(descipher);