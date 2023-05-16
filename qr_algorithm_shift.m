
function [lambda, iter] = qr_algorithm_shift(A, sigma, tol, max_iter)

    [m,n] = size(A);

    if (m ~= n)
        disp("Fehler! Gegebene Matrix ist nicht quadratisch.")
        return;
    endif

    for iter=1:max_iter

        sigma_k = sigma*eye(n,n);

        [QR, tau] = qr_householder(A-sigma_k);              # QR-Zerlegung von A
        
        for i = 1:n 
        
          A(i,:) = mult_QT(QR,tau, triu(QR)(i,:)'); # Implizites Berechnen von A = (Q'R')' durch mult_QT 
        
        endfor

        A += sigma_k;

        lambda = diag(A);                           # Abspeichern der Diagonalwerte von QR, welche EW Approx. von A sind
                
        if(max(abs(tril(A, -1))) < tol*norm(A,inf)) # Abbruch, wenn 'Q' kleiner als tol*norm(A, inf) ist
          return;
        endif
        
    endfor
endfunction