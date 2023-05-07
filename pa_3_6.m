% Programmieraufgabe 2.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
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
%   7.  GGN_method.m
%   
%   
% Housekeeping
clc;
clear;

%Loesen des Problems von UB 3.3


GGN_method(@func_a, @func_b, x0, tol, kmax)
