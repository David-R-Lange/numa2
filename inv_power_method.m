%%Funktion 
%
% Input:    -   A       :   
%           -   
%
% Output:   -   lam     :   
%           -   
%
function [lam, x] = inv_power_method(A, sigma, x0, tol, max_iter)

    x_k = x0;
    lam = 0;

    n = size(A,1);

    for k = 1:max_iter

        y = (A-sigma*eye(n,n))/x_k';
        x = y / norm(y, 2);
        lambda_old = lam;
        lam = x' * A * x;

        %Abbruch, wenn |lambda(k) - lambda(k-1)| <= tol*norm(A,1)
        %D.h. differenz der lambdas ist kleiner als 
        if(abs(lam - lambda_old) <= tol*norm(A,1))
            break;
        endif

    endfor
endfunction