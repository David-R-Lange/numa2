%%Funktion zum loesen eines beschraenkten nichtlinearen Ausgleichproblems
%
% Input:    -   Fa      :   Ausgangsfunktion
%           -   Fc      :   beschraenkende Funktion
%           -   x0      :   Anfangsvektor
%           -   tol     :   Fehlertoleranz und Abbruchkriterium, s.t. norm_dx <= tol
%           -   kmax    :   Maximale Iterationen
%
% Output:   -   x       :   Loesungsvektor
%           -   norm_dx :   2-Norm des letzten Schrittes
%           -   iter    :   # der Iterationen
%
function [x, norm_dx, iter] = GGN_method(Fa, Fc, x0, tol, kmax)
    

    for iter = 1:kmax

    endfor

endfunction