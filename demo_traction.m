%format rat
format short
%% Problem set up
Sig = [80 30; 30 40];
n = [1/2; sqrt(3)/2];

%* traction
t = Sig*n;

%* magnitude of normal stress
sig_x1 = n.'*Sig*n;


%% shear stress
tau_x1y1 = sqrt(norm(t)^2- sig_x1^2); 
display(tau_x1y1)

byHand = -10*sqrt(3)-15;
display(byHand)

%* alternatively
tau_vec = [-sqrt(3)/2; 1/2];  %*directin of shear stress
alt= n.'*Sig*tau_vec;


%% Principla stress
clc;
sig_x = Sig(1,1);
sig_y = Sig(2,2);
tau_xy = Sig(1,2);

dumm = (sig_x-sig_y)/2;
sig1 = (sig_x+sig_y)/2 +  sqrt((dumm)^2+tau_xy^2)
sig2 = (sig_x+sig_y)/2 -  sqrt((dumm)^2+tau_xy^2)


%* principal angle
dumm = 2*tau_xy/(sig_x-sig_y);
%theta_p = atan(dumm)/2;
display(theta_p)

unit_x = cos(theta_p);
unit_y = sin(theta_p);
pAxis = [unit_x; unit_y]
display(pAxis)
%% Principal Stress (matrix form)
clc;
[vec, val]=eig(Sig)