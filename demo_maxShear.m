%format rat
%format short

%% HW Problem - Biaxial Stresses
clc; clear;
format bank

Sig = [3600 0; 0 -1600];
sig_x = Sig(1,1);
sig_y = Sig(2,2);
tau_xy = Sig(1,2);

%* Only shear, no normal
%* from transformation equation, given sig_n=0 (no normal stress)
th_d = acos((-sig_x-sig_y)/(sig_x-sig_y))*0.5;
th_d = rad2deg(th_d);
tau_d = -0.5*(sig_x-sig_y)*sind(2*th_d) +0;

%* draw the direction for theta_d
n_d =[cosd(th_d); sind(th_d)];


%* Max shear, some normal
th_d = 45
tau_d = -0.5*(sig_x-sig_y)*sind(2*th_d) +0;
sig_d = 0.5*(sig_x+sig_y) +0.5*(sig_x-sig_y)*cosd(2*th_d)+0

%% Matrix Form
t = Sig*n
n_d =[cosd(th_d); sind(th_d)];


% display(norm(t))
% 
% %* alternatively
% R =[cosd(90) -sind(90); sind(90) cosd(90)];
% sig_x = n.'* Sig*n;
% tau_xy = n.'* Sig*R*n;
% 
% 


%% max shear
% % [vec, val] = eig(Sig);
% % 
% % n =[cosd(45); sind(45)]; %* direction of max shear
% % R =[cosd(90) -sind(90); sind(90) cosd(90)];
% % 
% % 
% % sig_x = n.'* Sig*n
% % tau_xy = n.'* Sig*R*n
