clear; clc;

% Visualization of 10.6.2.1 Explicit Method 
Eactual = csvread('ExplicitBLOCKACTUAL.csv');

Eestimate = csvread('ExplicitBLOCK.csv');
Eerror = csvread('ExplicitERROR.csv');
% E8estimate = csvread('Explicit8BLOCK.csv');
% E8error = csvread('Explicit8ERROR.csv');


figure(1);
% Actual Plot 
subplot(1,3,1);
mesh(Eactual);
xlim([0 12.5]);
title('Actual');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Explicit Estimate Plot
subplot(1,3,2);
mesh(Eestimate);
xlim([0 12.5]);
title('Explicit Estimate');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Explicit Estimate Error
subplot(1,3,3);
mesh(Eerror);
xlim([0 12.5]);
title('Explicit Error');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('% Error');

% % Explicit Estimate .8
% subplot(2,3,5);
% mesh(E8estimate);
% xlim([0 11.5]);
% title('Explicit .8 Estimate');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('U Values');
% 
% % Explicit .8 Error
% subplot(2,3,6);
% mesh(E8error);
% xlim([0 11.5]);
% title('Explicit .8 ERROR');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('% Error');




%% Visualization of 10.6.2.2 Implicit Method 

Eactual = csvread('ImplicitBLOCKACTUAL.csv');

Eestimate = csvread('ImplicitBLOCK.csv');
Eerror = csvread('ImplicitERROR.csv');
% E8estimate = csvread('Implicit8BLOCK.csv');
% E8error = csvread('Implicit8ERROR.csv');


figure(2);
% Actual Plot 
subplot(1,3,1);
mesh(Eactual);
xlim([0 12.5]);
title('Actual');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Implicit Estimate Plot
subplot(1,3,2);
mesh(Eestimate);
xlim([0 12.5]);
title('Implicit Estimate');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Implicit Estimate Error
subplot(1,3,3);
mesh(Eerror);
xlim([0 12.5]);
title('Implicit Error');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('% Error');

% % Implicit Estimate .8
% subplot(2,3,5);
% mesh(E8estimate);
% xlim([0 11.5]);
% title('Implicit .8 Estimate');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('U Values');
% 
% % Implicit .8 Error
% subplot(2,3,6);
% mesh(E8error);
% xlim([0 11.5]);
% title('Implicit .8 ERROR');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('% Error');

%% Visualization of 10.6.2.3 Crank Nicolson Method 

Eactual = csvread('CNBLOCKACTUAL.csv');

Eestimate = csvread('CNBLOCK.csv');
Eerror = csvread('CNERROR.csv');
% E8estimate = csvread('Implicit8BLOCK.csv');
% E8error = csvread('Implicit8ERROR.csv');


figure(3);
% Actual Plot 
subplot(1,3,1);
mesh(Eactual);
xlim([0 12.5]);
title('Actual');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Crank-Nicolson Estimate Plot
subplot(1,3,2);
mesh(Eestimate);
xlim([0 12.5]);
title('Crank-Nicolson Estimate');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Crank-Nicolson Estimate Error
subplot(1,3,3);
mesh(Eerror);
xlim([0 12.5]);
title('Crank-Nicolson Error');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('% Error');

% % Crank-Nicolson Estimate .8
% subplot(2,3,5);
% mesh(E8estimate);
% xlim([0 11.5]);
% title('Crank-Nicolson .8 Estimate');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('U Values');
% 
% % Crank-Nicolson .8 Error
% subplot(2,3,6);
% mesh(E8error);
% xlim([0 11.5]);
% title('Crank-Nicolson .8 ERROR');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('% Error');


%% Visualization of 10.6.2.3 Gauss Sliedel Method 

Eactual = csvread('GaussBLOCKACTUAL.csv');

Eestimate = csvread('GaussBLOCK.csv');
Eerror = csvread('GaussERROR.csv');
% E8estimate = csvread('Gauss8BLOCK.csv');
% E8error = csvread('Gauss8ERROR.csv');


figure(4);
% Actual Plot 
subplot(1,3,1);
mesh(Eactual);
xlim([0 12.5]);
title('Actual');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Crank-Nicolson Estimate Plot
subplot(1,3,2);
mesh(Eestimate);
xlim([0 12.5]);
title('Gauss-Sliedel Estimate');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('U Values');

% Crank-Nicolson Estimate Error
subplot(1,3,3);
mesh(Eerror);
xlim([0 12.5]);
title('Gauss-Sliedel Error');
xlabel('X Value Index');
ylabel('Time Index');
zlabel('% Error');

% % Crank-Nicolson Estimate .8
% subplot(2,3,5);
% mesh(E8estimate);
% xlim([0 11.5]);
% title('Gauss-Sliedel .8 Estimate');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('U Values');
% 
% % Crank-Nicolson .8 Error
% subplot(2,3,6);
% mesh(E8error);
% xlim([0 11.5]);
% title('Gauss-Sliedel .8 ERROR');
% xlabel('X Value Index');
% ylabel('Time Index');
% zlabel('% Error');
