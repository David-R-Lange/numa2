%%Funktion zum berechnen des betragsgroessten Eigenwertes und zug. Eigenvektor
%
% Input:    -   A       :   nxn Matrix 
%           -   x0      :   Startvektor x(0)
%           -   tol     :   Fehlertoleranz und Abbruchkriterium
%           -   max_iter:   Maximale # an Iterationen
%
% Output:   -   1am     :   Betragsgroesster Eigenwert der Matrix A
%           -   x       :   Zugehoeriger Eigenvektor zu lam
%
function [lam, x] = power_method(A, x0, tol, max_iter)

    x_k = x0;
    lam = 0;

    for k = 1:max_iter

        y = A*x_k;
        x = y / norm(y, 2);
        lambda_old = lam;
        lam = x' * A * x;

        %Abbruch, wenn |lambda(k) - lambda(k-1)| <= tol*norm(A,1)
        %D.h. differenz der lambdas ist kleiner als 
        if(abs(lam - lambda_old) <= tol*norm(A,1))
            return;
        endif

    endfor
endfunction