%%Funktion zum Berechnen einer
%
% Input:    -   f		:	Gegebene Funktion des AWP als function handle
%           -   t0  	:   Anfang der Zeitaufnahme
%           -   tmax    :   Ende der Zeitaufnahme
%	        -	y0		:	Anfangswert
%           -   tau0    :   Anfangsschrittweite
%           -   TOL     :   Toleranz
%
% Output:   -   t       :   Zeitpunkte der Loesungswerte
%           -   vals	:	Loesungswerte
%           -   tau     :   tatsaechlich genutzte Schrittweite
%           -   steps   :   # Schritte
%
function [t, vals, tau, steps] = rk43_adapt(f, t0, tmax, y0, tau0, TOL)

end
