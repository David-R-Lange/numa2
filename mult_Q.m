function [Qx] = mult_Q(QR, tau, x)
% Implizite Multiplikation Qx mit Hilfe der Vektoren v_k und tau.
% 
% Eingabeparameter:
%   QR: mxn-Matrix mit m>=n, wobei in der oberen rechten Dreiecksmatrix die
%       Einträge von R gespeichert sind. Unterhalb der Diagonale sind die
%       Einträge der Vektoren v_k gespeichert.
%   tau:nx1-Vektor
%   x:  mx1-Vektor (theoretisch auch mxm Matrix möglich
%
% Rückgabewerte:
%   Qx: nx1-Vektor

[~,n] = size(QR);

Qx = x;

for k = n:-1:1
    % Stelle v_k aus der Matrix QR her
    v = [1; QR(k+1:end,k)];
    % Passe Qx ab Zeile k an durch Multiplikation mit H_k=(I-tau_k v_k v_k')
    Qx(k:end,:) = Qx(k:end,:)-(tau(k)*v)*(v'*Qx(k:end,:));
endfor
endfunction