%%Funktion zum berechnen der abgeschnittenen Singulaerwertzerlegung 
%
% Input:    -   A       :   Datenmatrix
%           -   nu      :   Rang der abgeschnittenen Singulaerwertzerlegung
%
% Output:   -   C       :   Matrix der abgeschnittenen Singulaerwertzerlegung
%
function C = svd_approx(A, nu)

    [m, n] = size(A);

    if(nu > min(m,n))
        error("\nFehler. Der Rang der TruncSVD ist groesser als der Rang von der gegebenen Matrix.\n")
    endif

    C = zeros(m,n);

    [U, S, V] = svd(A);

    for j = 1:nu
        C += U(:,j) * S(j,j) * V(:,j)';
    endfor

endfunction