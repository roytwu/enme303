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

%% A (3-by-3) (Example1, Well-Posed Matx)
clc; clear;
A = [5 -2 3; -3 9 1; 2 -1 -7];
b = [-1; 2; 3];
augA = [A b];
x=A\b;
display(x)

%* Gauss-Seidel method (user-defined function)
sDigit = 4;                       %* singnificant digit
itr    = 10;                      %* number of iteration
out    = gSeidel(itr, augA, sDigit); %* augA must be 3 by 4
fprintf('Iteration output is...\n');
disp(out);
% disp(out(:,end));

%% A (3-by-3) (Example 2, Ill-Posed Matx)
clc; clear;
A = [1 1 0; 1 41/40 0; 0 1 31/30];
x = [-80; 90; 60];
b = A*x;
augA = [A b];


%* Gauss-Seidel method (user-defined function)
sDigit = 6;                       %* singnificant digit
itr    = 450;                      %* number of iteration
out    = gSeidel(itr, augA, sDigit); %* augA must be 3 by 4
fprintf('Iteration output is...\n');
disp(out);
% disp(out(:,end));

%% A is 2 by 2
clc; clear;
% format rational
%* initial guess
x1=0;
x2=0;

A=[1 -5; 7 -1];
b=[-4; 6];

% A=[7 -1; 1 -5];
% b=[6; -4];
augA = [A b];
x=A\b;

%* condition number
nA    = norm(A);
nAinv = norm(inv(A));
kappa = nA*nAinv;
fprintf('kappa is...%f\n\n', kappa)

% %* Gauss-Seidel method (user-defined function)
% sDigit = 6;                       %* singnificant digit
% itr    = 10;                      %* number of iteration
% out = gSeidel(itr, augA, sDigit); %* augA must be 3 by 4
% fprintf('Iteration output is...\n');
% disp(out);
% % disp(out(:,end));

itr = 20;
out = zeros(3, itr);
for i= 1:itr
    x1 = (augA(1, end) -augA(1,2)*x2 )/augA(1,1);
    x2 = (augA(2, end) -augA(2,1)*x1 )/augA(2,2);
    round(x1, 3, 'significant');
    round(x2, 3, 'significant');
    out(1,i) = i;
    out(2,i) = x1;
    out(3,i) = x2;
end 
fprintf('Iteration output is...\n');
disp(out);