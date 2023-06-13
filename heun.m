%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Heun-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:	nxn Matrix mit den Spalten als Loesungen vom AWP
%
function vals = heun(f, zerl, y_0)
    [~,n] = size(zerl);

    vals = zeros(n,n);
    vals(:,1) = y_0;

    for i = 1:n-1
        tau = zerl(i+1) - zerl(i);  % Definition von tau, damit Inkrementsfunktion besser lesbar
        
        vals(:,i+1) =  vals(i,i) + tau * 0.5 *(f(zerl(i),vals(i,i)) +
                            f(zerl(i+1),vals(i,i) + tau * f(zerl(i),vals(i,i)))
                        );
    end
end
