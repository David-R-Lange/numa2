% Programmieraufgabe 3.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 6.4.0-2
%
% Liste der eingesendeten Dateien:
%   1.  mult_QT.m
%   2.  mult_Q.m
%   3.  qr_Householder.m
%   4.  trisolve.m
%   5.  solve_LAP.m
%   6.  GGN_method.m
%
%
% Housekeeping
clc;
clear;

try
    %Fehlertoleranz soll aehnlich zur Maschinengenauigkeit sein
    tol = 1e-6;

    %Die maximale Anzahl der Iterationen soll passend hoch sein
    kmax = 1000;

    %Loesen des Problems von UB 3.3


    x0 = [0,2]';

    func_a = @(x) [ x(1).*x(2) ; x(1).+x(2)];
    func_c = @(x,y) (x.^2 + y.^2 - 4);

    [x, norm_dx, iter] = GGN_method(func_a, func_c, x0, tol, kmax)


    # %Loesen des Problems von UB 3.4.a


    # x0 = 0; %TODO change

    # GGN_method(@func_a, @func_c, x0, tol, kmax)


    # %Loesen des Problems von UB 3.4.b


    # x0 = [0.5, 1.5]';

    # GGN_method(@func_a, @func_c, x0, tol, kmax)

catch err
    fprintf("Fehler")
end_try_catch

