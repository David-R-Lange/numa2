%% Programmieraufgabe 11.7
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Kilian Hartmann, 10031802
%   2.  Rene-David Brüggemann, 10040204
%   3.  Jean-Luc Brüggemann, 10048805
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  banach_iter.m
%   2.  implizit_euler_banach.m
%   3.  implizit_trapez_banach.m
%
% Housekeeping
clc;
clear all;
close all;
tic;    % start clock

%%%%%%%%%%%%%%%%%%%%%%%%%% Definition der genutzten Variablen %%%%%%%%%%%%%%

eps = 1e-10;

kmax = 1000;

odefun = @(t,y) -y;

y0 = 1;

n = 10;

t0 = 0;

tend = 4;

e_euler = zeros(n);

e_trapez = zeros(n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Berechnung der Verfahren %%%%%%%%%%%%%%%%%%%

for i = 1:n
    zerl = 2^(-(i-1));
    tau = linspace(t0,tend,1/zerl);
    [iter_euler, vals_euler] = implizit_euler_banach(odefun,tau,y0,eps,kmax)
    [iter_trapez, vals_trapez] = implizit_trapez_banach(odefun,tau,y0,eps,kmax)

    y = odefun(zerl,y0);
    e_euler(i) = max(abs(vals_euler - y)); 
    e_trapez(i) = max(abs(vals_trapez - y));
end

%%%%%%%%%%%%%%%%%%%%%%%%%% Berechnung der Konvergenzordnung %%%%%%%%%%%%%

    ediffer_euler = mean(e_euler(2:n-1)./e_euler(3:n))
    p = log2(ediffer_euler)
    ediffer_trapez = mean(e_trapez(1:n-1)./e_trapez(2:n))
    p = log2(ediffer_trapez)
    
%%%%%%%%%%%%%%%%%%%%%%%%%% Interpretation der Loesung %%%%%%%%%%%%%%%%%%%
#{
    #}
