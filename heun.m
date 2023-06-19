%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Heun-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:	nxm Matrix mit den Spalten als Loesungen vom AWP
%
function vals = heun(f, zerl, y_0)
    [n,m] = size(zerl);

    vals = zeros(n,m);
    vals(1,1) = y_0;

    for i = 1:m-1
        for j = 1:n
            y_delt = vals(j,i);             % Def. von y_delt zur besseren ansicht
            
            ftj = f(zerl(j,i),y_delt);      % Def. von f(t_j,y_delt)
           
            tau = zerl(j,i+1) - zerl(j,i);  % Definition von tau, damit Inkrementsfunktion besser lesbar
           
            vals(j,i+1) = y_delt + tau*.5*(ftj + f( zerl(j,i+1) , y_delt + tau * ftj ));
        end
    end
end
