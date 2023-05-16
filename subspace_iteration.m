

function [lam, iter] = subspace_iteration(A, Z0,  tol, max_iter)

    Z = Z0;

    [m,n] = size(A);

    tau = ones(n,1);

    lam = 0;

    for iter = 1:max_iter

        for i = 1:n

            Y(:,i) = mult_QT(Z, tau, A(:,i));

        endfor

        Z = qr_householder(Y);

        lam_old = lam;

        lam = diag(Z);

        if(abs(lam - lam_old) < tol)
            return;
        endif

    endfor
endfunction