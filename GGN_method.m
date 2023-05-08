%%Funktion zum loesen eines beschraenkten nichtlinearen Ausgleichproblems
%
% Input:    -   Fa      :   Ausgangsfunktion
%           -   Fc      :   beschraenkende Funktion
%           -   x0      :   Anfangsvektor
%           -   tol     :   Fehlertoleranz und Abbruchkriterium, s.t. norm_dx <= tol
%           -   kmax    :   Maximale Iterationen
%
% Output:   -   x       :   Loesungsvektor
%           -   norm_dx :   2-Norm des letzten Schrittes
%           -   iter    :   # der Iterationen
%
function [x, norm_dx, iter] = GGN_method(Fa, Fc, x0, tol, kmax)
    
    x = x0;

    for iter = 1:kmax
        %Evaluierung der 2-Norm von x0
        norm_dx = norm(x, 2);
        
        %Abbrechen, wenn die 2-Norm von x0 kleiner als die Fehlertoleranz wird
        if(norm_dx < tol)
            return;
        endif

        %Evaluierung der Funktionen und derer Ableitung an der Stelle x^k
        [f_a, J_a] = [Fa(x), jacobian(Fa, x)(x)];
        f_c = feval(Fc,x);
        J_c = feval(jacobian(Fc, [x,y]),x);

        %Loesen des linearisierten Problems LAP(x^k) um x^k+1 auszurechnen 
        x = solve_LAP((f_a+J_a), x, (f_c+J_c), x);

    endfor

endfunction