% Programmieraufgabe 8.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  explizit_euler.m
%   2.  heun.m
%
% Housekeeping
clc;
clear all;
close all;
tic;    % start clock

% Anfang des Skripte

%% Definition der notwendigen Werte/Funktionen

% Definition der Funktion
f = @(t, y) y^2;

% Definition des Startwertes
y_0 = -4;

% Definition der Zeitzerlegung
delta = [0, 0.1, 0.2, 0.3];

%% Ausfuehrung der Einschrittverfahren

vals_euler = explizit_euler(f, delta, y_0)

vals_heun = heun(f, delta, y_0)

toc
