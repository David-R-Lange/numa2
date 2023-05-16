% Programmieraufgabe 5.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 6.4.0-2
%
% Liste der eingesendeten Dateien:
%   1.  qr_algorithm.m
%   2.  qr_householder.m
%   3.  mult_QT.m
%
%
% Housekeeping
clc;
clear;
tic;

% Anfang des Skriptes

tol = 1e-8;
max_iter = 10000;

A = [4,3,0 ; 3,4,0 ; 0,28/15,1];

B = [1,-1,-1 ; 4,6,3 ; -4,-4,-1];

C = [4,0,0,0 ; 1,2,0,0 ; 1,0,6-3*i,0 ; 1,0,0,42];

 [lambda1, iter] = qr_algorithm(A, tol, max_iter)

[lambda2, iter] = qr_algorithm(B, tol, max_iter)

[lambda3, iter] = qr_algorithm(C, tol, max_iter)

x = eig(A)

x = eig(B)

x = eig(C)

toc