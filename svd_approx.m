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

    C = zeros(m,n);                     # Null-Matrix mit dim. mxn fuer addition 

    [U, S, V] = svd(A);                 # Interne SVD nutzen um U, S, V zu bekommen

    for j = 1:nu
      C += S(j,j) * U(:,j) * V(:,j)';   # Implizite Matrix-Mult mit U(:,j) = mx1, S(j,j) = 1x1, V(:,j)' = 1xm
    endfor

endfunction