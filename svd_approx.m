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
        disp("\nFehler. Der Rang der TruncSVD ist groesser als der Rang von der gegebenen Matrix.\n")
        return;
    endif

    [U, S, V] = svd(A);

    for j = 1:nu
        C = U(:,1:j) * S(1:j,1:j) * V(:,1:j)';
    endfor

endfunction