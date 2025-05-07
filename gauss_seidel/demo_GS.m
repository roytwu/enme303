%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Gauss-Seidel method
%*              Use the new values of each as soon as you know them
%* History:     11/18/2021 initial version 
%*              05/05/2025 Remove the content related conditional numbers 
%* https://www.mathworks.com/help/symbolic/digits.html
%* ========== ========== ==========
%% Significant Digit
clc;  clear;
a      = 520.1234567;
sDigit = 2;
out    = round(a, sDigit, 'significant');
disp(out)

%% Example #1, 3-by-3 Well-Posed Matrix
clc; clear;
A = [5 -2 3; -3 9 1; 2 -1 -7];
b = [-1; 2; 3];
augA = [A b];
x = A\b;
display(x)

%* Gauss-Seidel method (user-defined function)
sDigit = 3;        %* singnificant digit (using 3 for the slides)
itr    = 10;       %* number of iteration
out    = gSeidel(itr, augA, sDigit); %* augA must be 3 by 4
fprintf('Iteration output is...\n');
disp(out);
% disp(out(:,end));

%% Example #2, 3-by-3 Ill-Posed Matrix
clc; clear;
A = [1 1 0; 1 41/40 0; 0 1 31/30];
x = [-80; 90; 60];
b = A*x;
augA = [A b];


%* Gauss-Seidel method (user-defined function)
sDigit = 5;        %* singnificant digit
itr    = 350;      %* number of iteration
out    = gSeidel(itr, augA, sDigit); %* augA must be 3 by 4
fprintf('Iteration output is...\n');
disp(out);
% disp(out(:,end));
