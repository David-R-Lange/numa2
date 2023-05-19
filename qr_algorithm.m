%%Funktion zum berechnen aller Eigenwerte mit dem QR-Verfahren
%
% Input:    -   A       :   nxn Matrix
%           -   sigma   :   boolean, true wenn die shift methode verwendet werden soll
%           -   tol     :   Fehlertoleranz
%           -   max_iter:   Maximale # an Iterationen
%
% Output:   -   1ambda  :   Approx. Eigenwerte der Matrix A
%           -   iter    :   Tatsaechliche # der Iterationen
%
function [lambda, iter] = qr_algorithm(A, sigma, tol, max_iter)

    [m,n] = size(A);

    if (m ~= n)
        disp("Fehler! Gegebene Matrix ist nicht quadratisch.")
        return;
    endif

    if (sigma ~= 0 && sigma ~= 1)
      disp("Fehler! Der Eingabewert sigma soll ein boolean sein. Werte nur true/1 oder false/0")
      return;
    endif

    sigma_k = 0;

    for iter=1:max_iter

        if(sigma)
          sigma_k = A(n,n)*eye(n,n);                # Anwenden des shifts mit A(n,n) = sigma
        endif

        [QR, tau] = qr_householder(A-sigma_k);      # QR-Zerlegung von A
        
        for i = 1:n 
        
          A(i,:) = mult_QT(QR,tau, triu(QR)(i,:)'); # Implizites Berechnen von A = (Q'R')' durch mult_QT 
        
        endfor

        A += sigma_k;                               # A mit shift-matrix addieren

        lambda = diag(A);                           # Abspeichern der Diagonalwerte von QR, welche EW Approx. von A sind
                
        if(max(abs(tril(A, -1))) < tol*norm(A,inf)) # Abbruch, wenn 'Q' kleiner als tol*norm(A, inf) ist
          return;
        endif
        
    endfor
endfunction