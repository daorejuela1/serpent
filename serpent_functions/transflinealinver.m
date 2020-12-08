function [round_out] = transflinealinver (container)
% TRANSFLINEALINVERT  lineal transfer to be executed on each iteration
%   Inputs:
%   container: container of the round
%   Outputs:
%   round_out: round_output
 X0 = container(97:128);
 X1 = container(65:96);
 X2 = container(33:64);
 X3 = container(1:32);
X2 = shift_right(X2,22);
X0 = shift_right(X0,5);
temporal = xors(X2,X3);
X2 = xors(temporal,(rotate_left(X1,7)));
temporal = xors(X0,X1);
X0 = xors(temporal,X3);
X3 = shift_right(X3,7);
X1 = shift_right(X1,1);
temporal = xors(X3,X2);
X3 = xors(temporal,(rotate_left(X0,3)));
temporal = xors(X0,X1);
X1 = xors(temporal,X2);
X2 = shift_right(X2,3);
X0 = shift_right(X0,13);
%COMENZAMOS LA LT
%concatenamos el resultado de la transformación lineal
round = horzcat(X3,X2,X1,X0);
round_out = round;