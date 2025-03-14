%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Demo of linear independence 
%* History:     04/15/2024 initial version 
%* ========== ========== ==========
clc; clear; close;
format short

%* column vectors
u = [3;   1;  0; 5;  2;   -8];
v = [-1;  2;  8; 60; 2;   1];
x = [1;   4;  4; 1;  345; 0];
y = [345; 2; -4; 0;  7;   99];
z = 2*u-2*v-x;
display(z)

%* Use row reduction to find linear independence
A1 = [u'; v'; x'];
A2 = [u'; v'; x'; y'; z'];

%* Number of linearly independent rows is equal to 
%* number of linearly independent columns
A3 = transpose([A1; y'; z']);

disp('reduced A is...')
disp(rref(A1))
disp(rref(A2))
disp(rref(A3))









