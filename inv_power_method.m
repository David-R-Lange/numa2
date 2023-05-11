%%Funktion zum berechnen des betragkleinsten Eigenwertes und zug. Eigenvektor
%
% Input:    -   A       :   nxn Matrix 
%           -   x0      :   Startvektor x(0)
%           -   tol     :   Fehlertoleranz und Abbruchkriterium
%           -   max_iter:   Maximale # an Iterationen
%
% Output:   -   1am     :   Betragskleinster Eigenwert der Matrix A
%           -   x       :   Zugehoeriger Eigenvektor zu lam
%
function [lam, x] = inv_power_method(A, sigma, x0, tol, max_iter)

    x = x0;
    lam = 0;

    n = size(A,1);

    for k = 1:max_iter

        # [QR, tau] = qr_Householder(A-sigma*eye(n,n));

        # y = mult_QT(QR, tau, x);

        y = (A-sigma*eye(n,n))/x';

        %Eigenvektorapproximation
        x = y / norm(y, 2);

        % Speichern des alten lambda fuer den Abbruch
        lambda_old = lam;

        %Eigenwertapproximation
        lam = x' * A * x;

        %Abbruch, wenn |lambda(k) - lambda(k-1)| <= tol*norm(A,1)
        if(abs(lam - lambda_old) <= tol*norm(A,1))
            return;
        endif

    endfor
endfunction