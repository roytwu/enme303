%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Demo of linear independence 
%* History:     04/15/2024 initial version 
%*              04/08/2025 Completely overhaul the exercises
%* ========== ========== ==========
clc; clear; close;
format short

%% column vectors
u = [3;  1;  0; 5;  2];
v = [-1; 2;  8; 3;  0];
q = [0;  4;  4; 1;  2];
r = [1;  1;  1; 0;  0];
s = [0; 2;  -2; 4; 0];
A = [u v q r s];
x = [1; 0; 2; -2; 0];

b = A*x;
display(b)


%% Use row reduction to find linear independence
A1 = [q'; r'; s'];      %* 3 vectors
A2 = [u'; q'; r'; b'];  %* 4 vectors 
A3 = [u'; v'; A1];      %* 5 vectors

%* Number of linearly independent rows is equal to 
%* number of linearly independent columns
disp(rref(A1))
disp(rref(A1'))


disp(rref(A2))
disp(rref(A2'))


disp(rref(A3))
disp(rref(A3'))





