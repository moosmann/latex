ca;
clear all
% directory and folder
ParPath = '/home/hp9361/LATEX/phdthesis/figures/RefractiveIndex/';

% Fe: 26 55
% Ca: 20 40
% Si: 14 84
% C: 6 12
% H2O: (1+2*8)=5.66 (1+2*16)=11
%% Refractive index
% Use values of refractive index of water from Henke
calcium = importdata([ParPath 'calcium_30ev_30kev.txt'],' ',2);
carbon = importdata([ParPath 'carbon_30ev_30kev.txt'],' ',2);
iron = importdata([ParPath 'iron_30ev_30kev.txt'],' ',2);
silicon = importdata([ParPath 'silicon_30ev_30kev.txt'],' ',2);
water = importdata([ParPath 'water_30ev_30kev.txt'],' ',2);

%% Data
X = water.data(:,1);
Y1 = [iron.data(:,2) calcium.data(:,2) silicon.data(:,2) carbon.data(:,2) water.data(:,2)];
Y2 = [iron.data(:,3) calcium.data(:,3) silicon.data(:,3) carbon.data(:,3) water.data(:,3)];

%% Plot and save
CreateFigure(X,Y1,[ParPath 'fig_delta'],'delta','southwest',[10^-7 1])
CreateFigure(X,Y2,[ParPath 'fig_beta'],'beta','southwest')
CreateFigure(X,Y1./Y2,[ParPath 'fig_ratio'],'ratio','southeast',[10^-2 10^4])
