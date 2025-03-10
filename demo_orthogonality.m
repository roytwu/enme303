%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Demo about perpendicularity 
%* History:     04/08/2024 initial version 
%* ========== ========== ==========
format short
%% Orthonormal vectors
clc; clear; 

%* perpendicularity 
a1 = [1; 1; 0];
a2 = [-sqrt(2); sqrt(2); 4*sqrt(2)];
a3 = [2; -2; 1];

%* unity
b1 = a1/norm(a1);
b2 = a2/norm(a2);
b3 = a3/norm(a3);

disp(b1)
disp(b2)
disp(b3)
%% Orthogonal matrix
clc;
B = [b1 b2 b3];
disp(B)

out = B*B';
disp(out)
%% when vectors are not normalized
clc;

%* no unity, perpendicularity only 
A= [a1 a2 a3];
out = A'*(A);
disp(out)







