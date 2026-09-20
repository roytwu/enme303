%* ========== ========== ==========
%* Author:      Roy Wu
%* Description: Shear force & bending moments
%* History:     05/17/2026 initial version 
%* ========== ========== ==========
clear; clc; close all

L = 10;
x = linspace(0, L, 1000);

%% Uniform distributed load
q0 = 2; %* constant intensity
q = q0*ones(size(x));
%q = (1/L)*q0*x;

%* simple beam
V = q0*L*0.5-q0*x;  %* shear force
%V = cumtrapz(x,q);
M = cumtrapz(x,V);  %* bending moment


subplot(3,1,1)
plot(x, q,'LineWidth',2)
ylabel('q')

subplot(3,1,2)
plot(x,V,'LineWidth',2)
ylabel('V')

subplot(3,1,3)
plot(x,M,'LineWidth',2)
ylabel('M')
xlabel('x')

%% Concentrated Load
pos    = 5.5; %* pos < L
remain = L - pos;
load   = 20;

for i = 1:length(x)
    if x(i) < pos
        V(i) = load*remain/L;
    else
        V(i) = -load*pos/L;
    end
end

M = cumtrapz(x,V);  %* bending moment

subplot(2,1,1)
plot(x, V, 'LineWidth', 2)
ylabel('V')

subplot(2,1,2)
plot(x, M, 'LineWidth', 2)
ylabel('M')
xlabel('x')

%% Multiple Concentrated Load
f1 = 7; %* load 1
f2 = 2; %* load 2
f3 = 4; %* load 3
support = (f1+ f2+ f3)*0.5;

pos1 = 3.0; %* position of load1  
pos2 = 5.0; %* position of load2
pos3 = 8.0; %* position of load3


for i = 1:length(x)
    if x(i) < pos1
        V(i) = support;
    elseif (x(i)<pos1) && (x(i) < pos2)
        V(i) = support - f1;
    elseif (x(i)<pos2) && (x(i) < pos3)  
        V(i) = -support + f3;
    elseif (x(i)<pos3) && (x(i) < L)  
        V(i) = -support;
    end
end

%* bending moment
M = cumtrapz(x,V);  

%* plotting
subplot(2,1,1)
plot(x, V, 'LineWidth', 2)
ylabel('V')

subplot(2,1,2)
plot(x, M, 'LineWidth', 2)
ylabel('M')
xlabel('x')
