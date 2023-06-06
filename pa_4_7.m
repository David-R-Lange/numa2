% Programmieraufgabe 4.7
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 6.4.0-2
%
% Liste der eingesendeten Dateien:
%   1.  power_method.m
%   2.  inv_power_method.m
%   3.  trisolve.m
%
% Housekeeping
clc;
clear;
tic;
% Anfang des Skriptes

A = [4,1,1,1;0,2,0,0;0,0,6-3*i,0;0,0,0,42];

% Beobachtung:
% Die EW sind auf der Hauptdiagonalen, womit die meisten 
% EV leicht zu erraten sind

tol = 1e-5;
max_iter = 50;

%Loesen des Problems (i)

x_1 = [1, 2, 1, -1]';
sigma_1 = 41;

fprintf('Loesung der Vektoriteration von Aufgabe c.i \n')
[lam, x] = power_method(A, x_1, tol, max_iter)

fprintf('Loesung der Inversen Vektoriteration von Aufgabe c.i \n')
[lam, x] = inv_power_method(A, sigma_1, x_1, tol, max_iter)

% Interpretation:
% Durch den Startvektor sind die EV hier mit einem negativen Vorzeichen behaftet.
% Die approx. von ipow ist auch sehr viel naeher am korrekten Wert, da sigma_1 sehr nah am EW
%
% Analytische Werte:
% EW:               EV: 
%   lam(pow) = 42   (1/38,0,0,1)' ~= (0.026316,0,0,1)


%Loesen des Problems (ii)

fprintf("\n\n\n")

x_2 = [1, 2, 1, 0]';
sigma_2 = 1.9;

fprintf('Loesung der Vektoriteration von Aufgabe c.ii \n')
[lam, x] = power_method(A, x_2, tol, max_iter)

fprintf('Loesung der Inversen Vektoriteration von Aufgabe c.ii \n')
[lam, x] = inv_power_method(A, sigma_2, x_2, tol, max_iter)

% Interpretation:
% Durch den Startvektor wird hier nur der komplexe Wert als groesster EW angesehen.
% Da sigma_2 sehr nahe am EW 2 ist, ist die approx. von diesem Wert ziemlich genau, aber hat noch
% einen kleinen komplexen anteil, durch den Startvektor
%
% Analytische Werte:
% EW:               EV: 
%  lam(pow) = 6+3i ((2+3i)/13,0,1,0)' ~= (0.15385-0.23077i,0,1,0)'
%  lam(ipow)= 2    (-1/2,1,0,0)'


%Loesen des Problems (iii)

fprintf("\n\n\n")

x_3 = [1, 2, 0, 0]';
sigma_3 = 4.1;

fprintf('Loesung der Vektoriteration von Aufgabe c.iii \n')
[lam, x] = power_method(A, x_3, tol, max_iter)

fprintf('Loesung der Inversen Vektoriteration von Aufgabe c.iii \n')
[lam, x] = inv_power_method(A, sigma_3, x_3, tol, max_iter)

% Interpretation
% Durch Startvektor wird groesster EW nicht erkannt und die EW sind komplett reellwertig. 
% Da sigma_3 so nah am EW ist, ist das Ergebnis von ipow auch gleich dem Analytischen Wert
%
% Analytische Werte:
% EW:             EV: 
%   lam(pow) = 4  (1,0,0,0)'
toc