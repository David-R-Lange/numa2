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

  function [ f,J ] = F_a_i(x)
    %Haendische Berechnung der Funktionen von 3.3

    f = [ x(1) .* x(2) , x(1).+x(2)] ;
    J = [ x(2) , x(1) ; 1 , 1 ];
  endfunction

  function [ f,J ] = F_c_i(x)
    %Haendische Berechnung

    f = x(1).^2 + x(2).^2 - 4;
    J = [2*x(1), 2*x(2)];
  endfunction

  [x, norm_dx, iter] = GGN_method(@F_a_i, @F_c_i, x0, tol, kmax)

      
  %Loesen des Problems von UB 3.4.a

  x0 = [0, 0]'';

  function [ f,J ] = func_a(x)
    % Synthesize function from Datapoint given in daten.m \\TODO

    f = [];
    J = [];
  endfunction
  
  function [ f,J ] = fempty_c(x)
    % leere Beschränkung

    f =[];
    J=[];
  endfunction

  [x, norm_dx, iter] = GGN_method(@func_a, @fempty_c, x0, tol, kmax)


  %Loesen des Problems von UB 3.4.b

  # data = [0, 1.99; 0.125, 2.484; 0.25, 2.6614; 1.5, 2.866];
  # x0 = [0.75, 0.5, 1.5]';
      
  # func_a = @(x(1),x(2),x(3)) [ norm(data(1,1) - x(2), 2) + norm(data(1,2) - x(3), 2) - x(1); norm(data(2,1) - x(2), 2) + norm(data(2,2) - x(3), 2) - x(1); norm(data(3,1) - x(2), 2) + norm(data(3,2) - x(3), 2) - x(1); norm(data(4,1) - x(2), 2) + norm(data(4,2) - x(3), 2) - x(1) ];
  # func_c = @(x(1),x(2),x(3)) (x(2).^2 + x(3).^2 - 4);

  # [x, norm_dx, iter] = GGN_method(@func_a, @fempty_c, x0, tol, kmax)        %Loesung von Teil (i)
  # [x, norm_dx, iter] = GGN_method(func_a, func_c, x0, tol, kmax)   %Loesung von Teil (ii)

catch err
  fprintf("Fehler. Das Programm wird abgebrochen. \n")
end_try_catch