%format rat
%format short
%% Problem set up
Sig = [80 30; 30 40];
n = [1/2; sqrt(3)/2];

%* equation from ENME220
sig_x = Sig(1,1);
sig_y = Sig(2,2);
tau_xy = Sig(1,2);
theta= 60;
sig_x1 = (sig_x+sig_y)/2 + (sig_x-sig_y)/2*cosd(2*theta)+tau_xy*sind(2*theta);
tau_z1y1 = -(sig_x-sig_y)/2*sind(2*theta) +tau_xy* cosd(2*theta);

%% Cauchy's Law
%* find traction
t = Sig*n;

%* find magnitude of normal stress
sig_x1 = n.'*Sig*n;


%% shear stress
clc;

%* Find shear stress from traction vector
tau_x1y1 = sqrt(norm(t)^2- sig_x1^2); 
display(tau_x1y1)

byHand = -10*sqrt(3)-15;
display(byHand)

%* Alternatively, rotate n 90 degress to get the direction of shear stress
%* Then project t onto the direction of the shear stress
angle= pi/2;
R  = [cos(angle) -sin(angle); sin(angle) cos(angle)];
tau_vec = R*n;
% tau_vec = [-sqrt(3)/2; 1/2];  %*directin of shear stress


alt= n.'*Sig*tau_vec;


%% Principla stress
clc;
sig_x = Sig(1,1);
sig_y = Sig(2,2);
tau_xy = Sig(1,2);

%* equation from ENME220
dumm = (sig_x-sig_y)/2;
sig1 = (sig_x+sig_y)/2 +  sqrt((dumm)^2+tau_xy^2)
sig2 = (sig_x+sig_y)/2 -  sqrt((dumm)^2+tau_xy^2)


%* principal angle
dumm = 2*tau_xy/(sig_x-sig_y);
theta_p = atan(dumm)/2;
display(theta_p)

%* principal axis
unit_x = cos(theta_p);
unit_y = sin(theta_p);
pAxis = [unit_x; unit_y]
display(pAxis)
%% Principal Stress (matrix form)
clc;
[vec, val]=eig(Sig)


%% Pure Torsion
clc;
syms t
sig = [0 t 0; t 0 0; 0 0 0];

[vec, val]=eig(sig)
