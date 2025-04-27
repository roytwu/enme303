%* ========== ========== ==========
%* Author: 　　　Roy Wu
%* Description: rpeated eigen value demo
%* History:     11/16/2021 initial version 
%*              05/06/2024 Adding one more example 
%* ========== ========== ==========

%% Lecture Demo
%* assemble the matrix A
clc; clear; 
a1 = [1; 0; 1; 1];
a2 = [0; 1; 0; 0];
a3 = [0; 5; 2; 0];
a4 = [0; -10; 0; 3];
A = [a1 a2 a3 a4];

%* lambda=1, value is founded by hand, repeated twice
eV_a = [-2; 0; 2; 1]; %* corresponding eigenvector a
eV_b = [0; 1; 0; 0];  %* corresponding engevector b

s = 3;               %* 1st free variable 
t = 27;              %* 2nd free variable
v = s*eV_a+t*eV_b;   %* linear cobo
disp('eigenvector is...');
disp(v)

disp('eigenvalue equation shows...');
disp(A*v)

%% the eig() function
[out1, out2] = eig(A);

%* display numbers in string for better alignment
%* for cosmetic purpose only
out1_str = num2str(out1,'%10.3f'); 

disp(out1_str)
disp(out2)
% disp(out1(:,1))


%* Diagonlaization
P = out1;
D = out2;
A_2 = P*D*inv(P);
display(A_2)


%% Diagonalization (Dependent Eigenvectors)
A = [2 4 3; -4 -6 -3; 3 3 1];

%* check the eigenvalues
values = eig(A);
display(values)

[vec, val] = eig(A);
display(real(vec))
display(real(val))