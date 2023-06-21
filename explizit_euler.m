%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Euler-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:   nxm Matrix mit den Spalten als Loesungen vom AWP
%
function vals = explizit_euler(f, zerl, y_0)
    n = length(y_0);
    m = length(zerl);
    vals = zeros(n,m);
    vals(:,1) = y_0;

    for j = 1:m-1
        tau = zerl(j+1) - zerl(j);

        vals(:,j+1) =  vals(:,j) + tau * f(zerl(j), vals(:,j));
    end
