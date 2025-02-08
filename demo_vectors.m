%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Demo for inner product and cross product
%* History:     02/06/2022 initial version, vectors can be plotted 
%*                         with different colors
%*              02/08/2025 Script is available to public 
%* ========== ========== ==========
%% Inner Product
clc; clear; %* Do not use them at the end of the script

%* example #1
u = [1; 1; -sqrt(2)];
v = [-1; -1; sqrt(2)];

%* example #2
% u = [sqrt(2); sqrt(2); 0];
% v = [0; 0; 3];


uNorm = norm(u);
vNorm = norm(v);
fprintf("norm of u is %f\n", uNorm);
fprintf("norm of v is %f\n", vNorm);

w = dot(u,v);
fprintf("u dot v is %f\n", w);

%* ----- ----- -----
%*     Cauchy–Schwarz inequality
%* ----- ----- -----
uvNorm = uNorm*vNorm;
fprintf("C-S inequality: %f <= %f\n", abs(w), uvNorm);

%% Cross Product
%* ----- ----- -----
%*     3 vector to illustrate
%* ----- ----- -----
clc; clear; 
%* case 1
u1 = [sqrt(2); sqrt(2); 0]; 
v1 = [0; 0; 3];     

%* case 2
% u1 = [1; 1; -sqrt(2)];
% v1 = [-1; -1; sqrt(2)];

w1 = cross(u1,v1);
disp('u1 corss v1 is...');
disp(w1)

%* ----- ----- -----
%*     Setting up quiver
%* ----- ----- -----
a = [u1 v1 w1];
a1 = a(1, :);
a2 = a(2, :);
a3 = a(3, :);
origin = [0 0 0];

%* 1st vector blue; 2nd vector red; 3rd vector dashed cyan
lineStyle = ["-b", "-r", "--c"]; 
for i =1:3
  plt =quiver3(0, 0, 0, a1(i), a2(i), a3(i), lineStyle(i));
  plt.LineWidth = 2;
  hold on  
end
axis equal


%%  meshgrid (Wk03 Demo - consistent systerm with 1 solution)
clc; clear;
[x, y] = meshgrid(-20:20:20);
z1 = (x - 3.*y -6)*0.5;    %* 1st linear eqn
z2 = (2*x-4*y-8)/3;        %* 2nd linear eqn
z3 = (3*x-6*y-5)/8;        %* 3nd linear eqn

surf(x, y, z1, 'FaceColor','r');
hold on
surf(x, y, z2, 'FaceColor','y');
hold on
surf(x, y, z3, 'FaceColor','c');

xlim([-20 20]);
ylim([-20 20]);
zlim([-30 30]);


%%  meshgrid (wk03-1, System is equivalent to the one shown above)
clc; clear; close;
[x, y] = meshgrid(-10:20:10);
z1 = (x - 3.*y -6)*0.5;  %* 1st linear eqn
z2 = 0*x-2*y-4;          %* 2nd linear eqn
z3 = 0*x+0*y+2;          %* 3nd linear eqn
surf(x, y, z1, 'FaceColor','r');
hold on
surf(x, y, z2, 'FaceColor','y');
hold on
surf(x, y, z3, 'FaceColor','c');

xlim([-20 20]);
ylim([-20 20]);
zlim([-30 30]);


%% meshgrid 2 (Wk03 Demo - Inconsistent System)
clc; clear; close;
[x, y] = meshgrid(-10:20:10);

z1 = (-2*x + 3.*y+1)*0.5;  %* 1st linear eqn
z2 = (0*x+1*y-8)*0.25;     %* 2nd linear eqn
z3 = (-4*x+8*y+1)/12;      %* 3nd linear eqn

surf(x, y, z1, 'FaceColor','r');
hold on
surf(x, y, z2, 'FaceColor','y');
hold on
surf(x, y, z3, 'FaceColor','c');


