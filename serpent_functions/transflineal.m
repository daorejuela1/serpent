function [round_out] = transflineal (vector,key,box,key_num)
% TRANSFLINEAL  lineal transfer to be executed on each iteration
%   Inputs:
%   vector: vector to apply the transfer to
%   key: key to apply the transfer
%   box: box to used for the iteration
%   key_num: iteration number
%   Outputs:
%   round_out: round_output
temporal = xors(vector,key(key_num,1:128)); 
container = boxes(temporal,box);
 X0 = container(97:128);
 X1 = container(65:96);
 X2 = container(33:64);
 X3 = container(1:32);
X0 = shift_left(X0,13);
X2 = shift_left(X2,3);
temporal = xors(X0,X1);
X1 = xors(temporal,X2);
temporal = xors(X3,X2);
X3 = xors(temporal,(rotate_left(X0,3)));
X1 = shift_left(X1,1);
X3 = shift_left(X3,7);
temporal = xors(X0,X1);
X0 = xors(temporal,X3);
temporal = xors(X2,X3);
X2 = xors(temporal,(rotate_left(X1,7)));
X0 = shift_left(X0,5);
X2 = shift_left(X2,22);
%concatenamos el resultado de la transformación lineal
round = horzcat(X3,X2,X1,X0);
round_out = round;