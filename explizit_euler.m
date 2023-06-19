%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Euler-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:   nxm Matrix mit den Spalten als Loesungen vom AWP
%
function vals = explizit_euler(f, zerl, y_0)
    [n,m] = size(zerl);

    vals = zeros(n,m);
    vals(1,1) = y_0;

    for i = 1:m-1
        for j = 1:n
            tau = zerl(j,i+1) - zerl(j,i);
            vals(j,i+1) =  vals(j,i) + tau * f(zerl(i), vals(j,i));
        end

    end
