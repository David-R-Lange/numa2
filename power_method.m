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
    x = x0;
    lam = 0;

    for k = 1:max_iter

        y = A*x;

        x = y / norm(y, 2); %Eigenvektorapproximation
        
        lambda_old = lam;   % Speichern des alten lambda fuer den Abbruch

        lam = x' * A * x;   %Eigenwertapproximation

        %Abbruch, wenn |lambda(k) - lambda(k-1)| <= tol*norm(A,1)
        if(abs(lam - lambda_old) <= tol*norm(A,1))
            return;
        endif
    endfor
endfunction