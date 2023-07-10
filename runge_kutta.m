%%Funktion zum Berechnen einer approximativen Loesung einer ODE mit dem allgemeinen expliziten s-stufigen Runge-Kutta-Verfahren
%
% Input:    -   A       :   Butcher-tableau als Matrix
%           -   b       :   Loesungsvektor des Butcher-tableau
%           -   f		:	Gegebene Funktion des AWP
%           -   t0  	:   Anfang der Zeitaufnahme
%           -   tend    :   Ende der Zeitaufnahme
%	        -	y_0		:	Anfangswert
%           -   n       :   # der Schritte
%
% Output:   -   vals	:	Loesungsmatrix
% 
function vals = runge_kutta(A, b, f, t0, tend, y0, n)

    % Def. der Dimension von y0
    m = length(y0);
    s = length(b);

    % Deklaration der notwendigen Matrizen und Vektoren
    vals = zeros(m,n+1);
    k = zeros(m,s);
    bk = zeros(m,n+1);

    % Initialisierung
    vals(:,1) = y0;
    tau = (tend-t0)/n;
    c = sum(A,2);

    % Def. der Zeitinkr.fkt
    t = t0;

    % RKV-Methode
    for i = 1:n
        for j = 1:s
            k(:,j) = f(t, vals(:,i) + tau * sum(k.*A(j,:),2));      % Def. von k_i nach Skript 9.4 RKV
            bk(:,i) += b(j) * k(:,j);
            t = t + c(j)*tau;
        end
        vals(:,i+1) = vals(:,i) + tau * bk(:,i);
    end
end
