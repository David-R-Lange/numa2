%%Funktion zum Berechnen einer ODE mit dem impliziten Euler-Banach-Verfahren
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

function [iter,vals] = implizit_euler_banach(odefun,zerl,y0,eps,kmax)
    n = length(zerl);
    vals = y0;
    iter = 0;

    for i = 1:n
        phi = @(y) y0 + zerl(i) .* odefun(0,y);
        [iter, vals] = banach_iter(phi, y0, eps, kmax);
        y0 = vals;
    end
end
