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
        tau = zerl(i+1) - zerl(i);  % Definition von tau, damit Inkrementsfunktion besser lesbar
        
        vals(:,i+1) =  vals(:,i) + tau * (f(zerl(i) + tau * 0.5, vals(:,i)) +
                           tau * 0.5 * f(zerl(i), vals(:,i))
                        );
    end
end
