%%Funktion zum berechnen aller Eigenwerte mit dem QR-Verfahren
%
% Input:    -   A       :   nxn Matrix
%           -   tol     :   Fehlertoleranz und Abbruchkriterium
%           -   max_iter:   Maximale # an Iterationen
%
% Output:   -   1ambda  :   Approx. Eigenwerte der Matrix A
%           -   iter    :   Tatsaechliche # der Iterationen
%
function [lambda, iter] = qr_algorithm(A, tol, max_iter)

    [m,n] = size(A);

    if (m != n)
        disp("Fehler! Gegebene Matrix ist nicht quadratisch.")
        return;
    endif

    for iter=1:max_iter

        for i=1:n
            for j=1:n

                lambda(i,1) = A(n,n);

                sigI = lambda(i,1)*eye(n,n);

                [QR, tau] = qr_householder(A-sigI);

                A = QR' + sigI;

                if(max(A(i:end,j:end)) < tol*norm(A,inf))
                    return;
                endif

            endfor
        endfor
    endfor
endfunction