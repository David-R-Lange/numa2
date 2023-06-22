% Programmieraufgabe 9.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  runge_kutta.m
%
% Housekeeping
clc;
clear all;
close all;
tic;    % start clock

%%%%%%%%%%%%%%  Deklaration und Initialisierung der genutzten Variablen %%%%%%%%%%

% Def. der Funktion dydt als autonomisierte ODE

f = @(t,y) [y(2), (1-y(1)^2) * y(2) - y(1)];

% Def. des Anfangswertes

y0 = [2,0];

% Def. des Butcher-Tableus

A = [0,0,0,0,0 ; 0.5,0,0,0,0 ; 0,0.5,0,0,0 ; 0,0,1,0,0 ; 1/6,1/3,1/3,1/6,0];

% Def. von b
b = [1/6,1/3,1/3,1/6,0];

% Def. der Anfangszeit
t0 = 0;

% Def. der Endzeit
tend = 20;

% Def. der Schritte
n = 80;

%%%%%%%%%%%%% Berechnung der ODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%

vals_rkv = runge_kutta(A,b,f,t0,tend,y0,n);

%%%%%%%%%%%% Testing before continue %%%%%%%%%%%%%%%%%%%%%%%

t_adapt = importdata('t_adapt.mat');

y_adapt = importdata('y_adapt.mat');


%%%%%%%%%%%% Plotten der Berechneten Werte %%%%%%%%%%%%%%%%%%
subplot(2,1,1), 
plot(t_adapt, y_adapt)
legend
title("Berechnungen der Van der Pol Gleichung  mit der adaptiven RK3(4)-Methode")

t = linspace(t0,tend,n);
subplot(2,1,2),
plot(t, vals_rkv)
legend
title("Berechnung der Van der Pol Gleichung mit der allgemeinen expl. RKV")
toc
