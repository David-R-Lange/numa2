%%Funktion zum Berechnen einer ODE mit dem impliziten Trapez-Banach-Verfahren
%
% Input:    -   odefun  :   Beschreibung des jeweiligen Anfangswertproblems
%           -   zerl    :   Zerlegung der Zeitvariable
%           -   y0      :   Anfangswert
%           -   eps     :   Erstes Abbruchkriterium fuer das verwendete Fixpunkverfahren
%           -   kmax    :   Zweites Abbruchkriterium fuer das verwendete Fixpunkverfahren
%
% Output:   -   iter	:	Tatsaechlichen Iterationen
%           -   vals    :   Loesungen
% 

function [iter,vals] = implizit_trapez_banach(odefun,zerl,y0,eps,kmax)

    for iter = 1:kmax

    end

end
