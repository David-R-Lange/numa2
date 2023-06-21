%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Heun-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:	nxm Matrix mit den Spalten als Loesungen vom AWP
%
function vals = heun(f, zerl, y_0)
    n = length(y_0);
    m = length(zerl);
    vals = zeros(n,m);
    vals(:,1) = y_0;

    for j = 1:m-1
        y_delt = vals(:,j);             % Def. von y_delt zur besseren ansicht

        ftj = f(zerl(j),y_delt);      % Def. von f(t_j,y_delt)

        tau = zerl(j+1) - zerl(j);  % Definition von tau, damit Inkrementsfunktion besser lesbar

        vals(:,j+1) = y_delt + tau*.5*(ftj + f( zerl(j+1) , y_delt + tau * ftj ));
    end
end
