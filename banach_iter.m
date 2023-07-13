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
    phi_y = Phi(y);
    for iter = 1:kmax
	y = phi_y;
        phi_y = Phi(y);
        if(abs(phi_y - y) <= eps)
            break;
    end
    y = phi_y;
end
