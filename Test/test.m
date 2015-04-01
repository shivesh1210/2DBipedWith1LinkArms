close all
clear all
clc

% Go back to previous directory
cd ..
% Load an already optimised set of parameters for simulation
load('Optimisation Parameters Results\Optim_Parameters11_V10.mat');

global poly polyp T Tint vec_T impactindex xstep1 xstep2

Hydroid_initialisation_2D

criteria = Hydroid_Trajec(Optim_Parameters);
[C, Ceq] = Hydroid_constraints(Optim_Parameters);

xstart = 0;
[xstep1] = animation(poly(:,1:impactindex), xstart);
title('Impact');
% pause(5);
title('Step 2');
[xstep2] = animation(poly(:,impactindex+1:end), xstep1);
Tint
figure;
hold on
x1 = [Tint Tint];
y1 = [-5 5];
line(x1,y1,'Color', 'k');
% plot(vec_T, polyp(:,:));
% legend('Tint','q1d','q2d','q3d','q4d','q5d','q6d','q7d','q8d','q9d','qp1d or qp2d');
plot(vec_T, polyp(1:5,:));
legend('Tint','q1d','q2d','q3d','q4d','q5d');
figure;
hold on
x1 = [Tint Tint];
y1 = [-pi/4 pi/4];
line(x1,y1,'Color','k');
plot(vec_T, poly(:,:));
legend('Tint','q1','q2','q3','q4','q5','q6','q7','q8','q9','qp1 or qp2');
% plot(vec_T, poly(1:5,:));
% legend('Tint','q1','q2','q3','q4','q5');

% Plot the start, intermediate and final position of biped body
animation(poly(:,1), 0);    % Start
[xstart] = animation(poly(:,impactindex), 0);    % First Impact (i.e. Intermediate position)
[x] = animation(poly(:,end), xstart);        % Second Impact (i.e. Final position) 

% Plot handheld device's acceleration characterstics
phone_characteristics_numerical   % Plots phone's acceleration using numerical differentiation
phone_characteristics_analytical  % Plots phone's acceleration using analytical differentiation

% Come back Test directory after the program ends
cd('Test');