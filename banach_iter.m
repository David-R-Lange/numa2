%%Funktion zum Berechnen des Fixpunktes eines gegebenen Wertes
%
% Input:    -   Phi     :   Fixpunktfunktion
%           -   y0      :   Anfangswert
%           -   eps     :   Abbruchkriterium
%           -   kmax    :   Abbruchkriterium
%
% Output:   -   iter    :   Tatsaechliche Iterationen
%           -   y       :   Loesung der Fixpunktgleichung
% 
function [iter, y] = banach_iter(Phi, y0, eps, kmax)
    y = y0;
    for iter = 1:kmax
        y_old = y;
        y = Phi(y);
        if(abs(y_old - y) <= eps)
            break;
    end
end
