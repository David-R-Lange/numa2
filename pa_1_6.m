% Programmieraufgabe 1.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%
% Programmiersprache: Octave
% Version:            version 6.4
%
% Liste der eingesendeten Dateien:
%   1.  is_regular.m
%   2.  mult_QT.m
%   3.  qr_Householder.m
%   4.  trisolve.m
%   
% Housekeeping
clc;
clear;

%Aufstellen des linearen Gleichungssystem
A = [1 1; 1 2; 1 3; 1 4; 1 5; 1 6];
b = [4.2, 2.6, 3.4, 3.2, 4.5, 5.1];

% Householder-Faktorisierung mit der Funktion aus a)
[A, tau] = qr_Householder(A)

if is_regular(A)
  y = mult_QT(A, tau, b')
  x = trisolve(0, A, y)
end

