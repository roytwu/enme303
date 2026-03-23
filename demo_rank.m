%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: rank, column interpretation, the overload of rref()
%* History:     03/22/2026 initial version 
%* ========== ========== ==========
%% Basics of Rank
clear; clc;
%* rank = number of pivots 
a1 = [2; 4; 0];
a2 = [5; 11; 1];
a3 = [1; 5; -1];
A = [a1 a2 a3];  

% b = [1; 5; 3]; 
% augA = [A b];   %* augmented matrix
disp(rref(A))  
disp(rank(A))

%* Build a 3 by 3 matrix with rank = 1
a4 = [1; 0; 0];
a5 = [0; 0; 0];
A= [7.77*a2 2*a2 -5*a2];
rank(A)

%* Build a 3 by 3 matrix with rank = 2
dumm = 6.4*a1+ 4*a2;   %* linear combo of a1 and a2
dumm = 5*dumm + 392*a1;
B= [5.7*a1 a2  dumm];

%* Build a 3 by 3 matrix with rank = 3
x = [1; 0; 0];
y = [0; 1; 0];
z = [0; 0; 1];
dumm1 = 3.4*x+5.7*y;
dumm2 = 2*z+100*y;
C = [5*x+y  x-7*y 3*z];

%% Basic & free variables 
%* Week04 slides, page 3
a1 = [0 -3 -6 4 9];
a2 = [-1 -2 -1 3 1];
a3 = [-2 -3 0 3 -1];
a4 = [1 4 5 -9 -7];
A = [a1; a2; a3; a4];
%C = A(:, 1:4);

[R, piv] = rref(A);
% [R, piv] = rref(C);
% det(C)

%% Determinant 6 by 6 
clc; clear;
a1 = [-4; 0; 0; 0; 0; 0];
a2 = [392; 0.25; 77; 448; -52; 6];
a3 = [0; 0; 2; 0; 0; 4];
a4 = [68; 0; 5.7; 1; 66; 6.4];
a5 = [0; 0; 354; 0; 3; 392];
a6 = [55; 0; 4; 0; 0; 8];

A = [a1 a2 a3 a4 a5 a6]; %*assemble!
% [R, piv] = rref(A);

r1 = A(1,:); %* Retrieve the 1st row

C11 = A(2:6, 2:6);
C11 = +det(C11);

dum1 = A(2:6, 1);
dum2 = A(2:6, 3:6);
C12 = [dum1 dum2];
C12 = -det(C12);

dum1 = A(2:6, 1:2);
dum2 = A(2:6, 4:6);
C13 = [dum1 dum2];
C13 = +det(C13);

dum1 = A(2:6, 1:3);
dum2 = A(2:6, 5:6);
C14 = [dum1 dum2];
C14 = -det(C14);

dum1 = A(2:6, 1:4);
dum2 = A(2:6, end);
C15 = [dum1 dum2];
C15 = det(C15);

C16 = A(2:6, 1:5);
C16 = -det(C16);
detA = r1(1)*C11 +r1(2)*C12 +r1(3)*C13 +r1(4)*C14 +r1(5)*C15 +r1(6)*C16;
disp(detA)

% %* randomly create a column vector b
% b = [2; 1; 4; 4; 5; 9];
% augA = [a1 a2 a3 a4 a5 a6 b];
% % out = rref(augA)
% [ref, piv] = rref(augA)

%* strategically create a column vector b
x = [1; 2; 1; 0; 1; -2];
b = A*x;
augA = [a1 a2 a3 a4 a5 a6 b]; 
[R, piv] = rref(augA)

%* Play with basic and free variable
augA = [a1 a2 a3 a6 a5 a4 b]; 
[R, piv] = rref(augA)

% %* Play with basic and free variable
% augA = [a1 a2 a3 a4 a6 a5 b]; %*assemble!
% [R, piv] = rref(augA)