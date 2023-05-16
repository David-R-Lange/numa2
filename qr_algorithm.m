%%Funktion zum berechnen aller Eigenwerte mit dem QR-Verfahren
%
% Input:    -   A       :   nxn Matrix
%           -   tol     :   Fehlertoleranz
%           -   max_iter:   Maximale # an Iterationen
%
% Output:   -   1ambda  :   Approx. Eigenwerte der Matrix A
%           -   iter    :   Tatsaechliche # der Iterationen
%
function [lambda, iter] = qr_algorithm(A, tol, max_iter)

    [m,n] = size(A);

    if (m ~= n)
        disp("Fehler! Gegebene Matrix ist nicht quadratisch.")
        return;
    endif

    for iter=1:max_iter

        [QR, tau] = qr_householder(A);              # QR-Zerlegung von A
        
        for i = 1:n 
        
          A(i,:) = mult_QT(QR,tau, triu(QR)(i,:)'); # Implizites Berechnen von A = (Q'R')' durch mult_QT 
        
        endfor

        lambda = diag(A);                           # Abspeichern der Diagonalwerte von QR, welche EW Approx. von A sind
                
        if(max(abs(tril(A, -1))) < tol*norm(A,inf)) # Abbruch, wenn 'Q' kleiner als tol*norm(A, inf) ist
          return;
        endif
        
    endfor
endfunction