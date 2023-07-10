%% Programmieraufgabe 10.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Kilian Hartmann, 10031802
%   2.  Rene-David Brüggemann, 10040204
%   3.  Jean-Luc Brüggemann, 10048805
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

%%%%%%%%%%%%%%%%%%%%%%% Definition der variablen zum loesen der Aufgabe %%%%%%%%%%%%%%%%%%%%

y0 = [0,10];

t0 = 0;

tend = 5;

n = [25,34,35,36,50,500];

f = @(t,y) [-10*y(1) + 9* y(2), 9*y(1) - 10*y(2)];

A = [0,0,0,0 ; 0.5,0,0,0 ; 0,0.5,0,0 ; 0,0,1,0];

b = [1/6,1/3,1/3,1/6];

m = length(n);

%%%%%%%%%%%%%%%%%%%% Berechnungen der Variablen und plotten dieser %%%%%%%%%%%%%%%%%%%%%%%%%%%


for i = 1:m
    h = n(i);
    vals = runge_kutta(A,b,f,t0,tend,y0,h);
    delta = linspace(t0,tend,h+1);

    subplot(3,3,i); 
    plot(delta, vals);
    title(sprintf("Graph des klassischen RKV mit Schrittweite %d", h));
end

[t,vals] = ode45(f,[t0,tend],y0);
subplot(3,3,[7,9]);
plot(t,vals(:,1));
title(sprintf("Graph des klassischen RKV mit ode45"));
toc
