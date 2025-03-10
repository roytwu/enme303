%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Basic coommands in matrix operation - A\b, rref(),inverse, & determinant. 
%               One can use these commands to find the answer key for 
%               most of the HWs before the midterm exam.
%* History:     10/02/2021 initial version 
%*              03/16/2022 share to public repo
%*              03/10/2025 Fine tuning by adding comments
%* ========== ========== ==========
%% Matrix lego
clc; clear;
%* ----- ----- ----- ----- -----
%*     matrix lego (block matrices) - rows
%* ----- ----- ----- ----- -----
a1 = [11 12 13 14 15 16 17]; 
a2 = [21 22 23 24 25 26 392]; 
a3 = [31 32 33 34 35 36 37]; 
a4 = [41 42 43 44 45 46 47]; 
a5 = [51 52 53 54 55 56 57]; 
A= [a1; a2; a3; a4; a5];
% B= [0;0;0;0;10;17;14];
disp(A)

out1 = A(3, 3);
fprintf('A(3,3) is ...%f', out1)

out2 = A(2:4,:);
fprintf('\n\nA(2:4, :) is ...\n')
disp(out2)

% %* ----- ----- ----- ----- -----
% %*     matrix lego (block matrices)  - columns
% %* ----- ----- ----- ----- -----
% a1 = [11; 21; 31; 41; 51;]; 
% a2 = [12; 22; 32; 42; 52;]; 
% a3 = [13; 23; 33; 43; 53;]; 
% a4 = [14; 24; 34; 44; 54;]; 
% a5 = [15; 25; 35; 45; 55;];  
% a6 = [16; 26; 36; 46; 56;];  
% a7 = [17; 27; 37; 47; 57;];  
% A = [a1 a2 a3 a4 a5 a6 a7];
% disp(A)

%% Augemented Matrix with rref() 
%* If yo can write matrix operation on a paper, 
%* it can be written in the same way in MATLAB 
clc; clear;

A = [2 5 1; 4 11 5; 0 1 -1];  
b = [1; 5; 3];  %* assume k=5 
augA = [A b];   %* augmented matrix
disp(rref(augA))  

disp("Solution of the linear system is...\n")
disp(A\b)

%% Inverse (3x3) - Sanity Check
clc; clear;
A= [0 1 2; 1 0 3; 4 -3 8];

invA= [-9/2 7 -3/2; 
        -2  4  -1; 
        3/2 -2 1/2];

fprintf("\nA times A inverse is...\n")
disp(A*invA)

fprintf("\nA inverse times A is...\n")
disp(invA*A)
%% Determinant (3x3)
clc; clear;
A= [0 1 2; 1 0 3; 4 -3 8];
out = det(A);
fprintf('determinant is %f\n\n', out)


%* inverse 
invA= [-9/2 7 -3/2; -2 4 -1; 3/2 -2 1/2];
% disp(A*invA)

a1 = A(2:3, 2:3);  %* M11
dum1 = A(2:3, 1);
dum2 = A(2:3, 3);
a2 = [dum1 dum2];  %* M12
a3 = A(2:3, 1:2);  %* M13
disp(a3)
%* find the det using 2x2 submatrices
out = A(1,1)*det(a1) -A(1,2)*det(a2) +A(1,3)*det(a3); 
fprintf('determinant is %f\n\n', out)

%% Determinant (4x4)
clc; clear;
B = [1 -2 3 0; -1 1 0 2; 0 2 0 3; 3 4 0 2];
C11 = B(2:4, 2:4); %*C11
display(C11)

%* "dum" means dummy (meaningless) variables
dum1 = B(2:4, 1); 
dum2 = B(2:4 ,3:4);
C12 = -[dum1 dum2]; %* C12 
display(C12)

dum1 = B(2:4, 1:2);
dum2 = B(2:4, 4);
C13 = [dum1 dum2]; %* C13
display(C13)

C14 = -B(2:4, 1:3); %*C14
display(C14)

out = B(1,1)*det(C11) + B(1,2)*det(C12)... 
      +B(1,3)*det(C13) + B(1,4)*det(C14);
fprintf('determinant of B (4x4) is %f\n\n', out)
fprintf('Determinant of B (4x4) is %f\n\n', det(B))

