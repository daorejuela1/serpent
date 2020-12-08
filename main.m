%   MAIN - Testing for the serpent encryption a decryption code with Matlab
%
%   Inputs:
%   
%   plain_text: B31FDE105462CFE3CCD2DC2197230568
%   key: 8000000000000000000000000000000029ABEF21A93ED0F42340ED32A87D1679
%   
%   Output:
%   B31FDE105462CFE3CCD2DC2197230568
% Author: David Orejuela
% Work address
% email: daorejuela1@outlook.com
% Website: https://github.com/daorejuela1
% Nov 2016; Last revision: 08-Dec-2020
clc;
clear;
addpath("serpent_functions/")
plain_text = 'B31FDE105462CFE3CCD2DC2197230568';
key = '8000000000000000000000000000000029ABEF21A93ED0F42340ED32A87D1679';
combination = serpent_encrypt(plain_text, key);
disp('Encrypted result:');
disp(combination);
plain_result = serpent_decrypt(combination, key);
disp('Decrypted result:');
disp(plain_result);