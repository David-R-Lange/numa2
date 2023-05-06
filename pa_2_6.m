% Programmieraufgabe 2.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031
%
% Programmiersprache: Octave
% Version:            version 6.4
%
% Liste der eingesendeten Dateien:
%   1.  is_regular.m
%   2.  mult_QT.m
%   3.  mult_Q.m
%   4.  qr_Householder.m
%   5.  trisolve.m
%   6.  solve_LAP.m
%   
%   
% Housekeeping
clc;
clear;

%Loesen der Uebungsaufgabe 2.3
A1 = [1,0,0; 0,1,0; 0,0,1];
a1 = [4/3, 7/3, 2/3];
C1 = [-1, 1; 2, 4; -2, -1];
c1 = [3, 6];

x1 = solve_LAP(A1, a1, C1, c1)

%Loesen der Uebungsaufgabe 2.5
A2 = [2*sqrt(2), 6*sqrt(2), -1.5*sqrt(2); 4, 6, 2.5; 6, 6, 2.5];
a2 = [12, 12, 9];
C2 = [0, 1, -1];
c2 = [1];

x2 = solve_LAP(A2, a2, C2, c2)