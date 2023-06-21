%%Funktion zum Berechnen einer approximativen Loesung einer ODE mit dem allgemeinen expliziten s-stufigen Runge-Kutta-Verfahren 
%
% Input:    -   A       :   Butcher-Tabluea-Matrix 
%           -   b       :   b-Vektor n dim
%           -   f		:	Gegebene Funktion des AWP
%           -   t0  	:   Anfang der Zeitaufnahme
%           -   tend    :   Ende der Zeitaufnahme
%	        -	y_0		:	Anfangswert
%           -   n       :   # der Schritte
%
% Output:   -   vals	:	nxn Matrix mit den Spalten als Loesungen vom AWP
%
function vals = runge_kutta(A, b, f, t0, tend, y0, n)
   
    % Def. der Dimension von y0
    m = length(y0);

    % Def. der Zeitinkr.fkt
    delta = t0;
    
    % Deklaration der notwendigen Matrizen und Vektoren
    vals = zeros(m,m);
    k = zeros(n);
    c = zeros(n);
   
    % Initialisierung
    vals(:,1) = y0;
    k = f(t0, vals);

    % RKV-Methode
    for i = 1:n-1
        y_delt = vals(:,i);
        c(i) = A(:,i);                               % Def. von c(i) nach Lemma 9.8
        k(i) = f(delta+c(i)*1, y_delt + A(:,i)*k(:)); %Def. von k(i) nach Skript 9.4 RKV
        vals(:,i+1) = y_delt + b(i)*k(i);
        delta = delta + 1;
    end
end
