%%Funktion zum Berechnen einer approximativen Loesung einer ODE mit dem allgemeinen expliziten s-stufigen Runge-Kutta-Verfahren 
%
% Input:    -   f		:	Gegebene Funktion des AWP
%           -   zerl	:	Zerlegung der Zeitvariable
%	        -	y_0		:	Anfangswert
%
% Output:   -   vals	:	nxn Matrix mit den Spalten als Loesungen vom AWP
%
function vals = runge_kutta(A, b, f, t0, tend, y0, n)
  delta = t0;
  vals = zeros(n,n);
  vals1,:) = y0;
  for i = 1:n
      t = ti + tau(i,:);
  end
end
