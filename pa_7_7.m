% Programmieraufgabe 7.7
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  ode_SIRD.m
%   2.  ode_SIRDQ.m
%
% Housekeeping
clc;
clear all;
close all;
tic;    # start clock

% Anfang des Skriptes

##############  Modellierung des Ebola-Virus Ausbruchs in Zaire von 1976    ####################

delta = 0.73;
beta = 0.27;
gamma = 0.23;

N_0 = 125000;

I_0 = 5;

t_0 = 0;

t_max = 30;

alpha = 3.15e-5;

[t, y] = lsode(@(t, y) ode_SIRD(t, y, alpha, beta, gamma, delta), [t_0, t_max], y_0);



alpha_q = 8.7e-6;

omega = 0.75;

[t, y] = lsode(@(t, y) ode_SIRD(t, y, alpha_q, beta, gamma, delta, omega), [t_0, t_max], y_0);


toc