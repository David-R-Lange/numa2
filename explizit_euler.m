%%Funktion zum Berechnen einer approximativen Loesung eines AWP mit dem Euler-Verfahren
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals		:	Matrix
%
function vals = explizit_euler(f, zerl, y_0)
    [~,n] = size(zerl);

    vals = zeros(n,n);
    vals(:,1) = y_0;

    for i = 1:n-1
        vals(:,i+1) =  vals(i,i) + (zerl(i+1)-zerl(i)) * f(zerl(i), vals(i,i));
    end

end
