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
    m = length(y0);
    g = zeros(n,1);
    vals = zeros(n,m);

    vals(1,:) = y0;

    for iter = 1:kmax
        for i = 1:n
            for j = 1:n
                g(i) += vals(i,:) + zerl(i)*odefun(zerl(i),g(j));
            end
            vals(i+1,:) += vals(i,:) + zerl(i)*odefun(zerl(i),g(i));
        end
    end
end
