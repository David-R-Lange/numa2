%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Runge-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:	nxn Matrix mit den Spalten als Loesungen vom AWP
%
function vals = runge(f, zerl, y_0)
    [n,m] = size(zerl);

    vals = zeros(n,m);
    vals(1,1) = y_0;

    for i = 1:m-1
        for j = 1:n
            tau = zerl(j,i+1) - zerl(j,i);  % Definition von tau, damit Inkrementsfunktion besser lesbar
            y_delt = vals(j,i);             

            vals(j,i+1) = y_delt + tau * f(zerl(j,i+1)*0.5, y_delt +
            tau * 0.5 * f(zerl(j,i), y_delt));
        end
    end
end
