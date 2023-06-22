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
    s = length(b);
    
    % Deklaration der notwendigen Matrizen und Vektoren
    vals = zeros(m,n);
    k = zeros(m,n);
    kschritt = zeros(m,n);
    c = zeros(n,1);
   
    % Initialisierung
    vals(:,1) = y0;
    tau = 1/n;

    % Def. der Zeitinkr.fkt
    t = t0;
    
    % RKV-Methode
    for i = 1:n-1
        for l = 1:s-1
            t = t + c(i)*tau;
            for j = 1:l-1
                c(i) += A(l,j);   % Def. von c(i) nach Lemma 9.8
                kschritt(:,i) += A(l,j) * k(:,j);
            end
            k(:,i) = f(t, vals(:,i) + tau*kschritt(i));      % Def. von ki nach Skript 9.4 RKV
            vals(:,i+1) = vals(:,i) + b(l)*k(:,i);
        end
    end
end
