function true = is_regular(A)
% Prüft, ob gegebene Matrix R, welche in A gespeichert ist, regulär ist 
%
% Eingabeparameter:
%   A:  mxn-Matrix mit m>=n, wobei in der oberen rechten Dreiecksmatrix die
%       Einträge von R gespeichert sind. Unterhalb der Diagonale sind die
%       Einträge der Vektoren v_k gespeichert.
%
% Rückgabewerte:
%   true: bool, wenn true (=1) dann ist die Matrix regulär

% Setze ein epsilon, normalerweise sqrt(maschinengenauigkeit)
eps = 10^(-6);

[m,n]= size(A);
l=min(m,n);

true=1;
for i=1:l
    % Überprüfe, ob ein Diagonalelement (bis auf Rundungsfehler) Null ist
    if abs(A(i,i)) < eps
        % Wenn ja, ist R nicht regulär
        true=0;
    end
end

end