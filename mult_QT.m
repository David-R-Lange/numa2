function [QTx] = mult_QT(QR, tau, x)
% Implizite Multiplikation Q^Tx mit Hilfe der Vektoren v_k und tau.
% 
% Eingabeparameter:
%   QR: mxn-Matrix mit m>=n, wobei in der oberen rechten Dreiecksmatrix die
%       Einträge von R gespeichert sind. Unterhalb der Diagonale sind die
%       Einträge der Vektoren v_k gespeichert.
%   tau:nx1-Vektor
%   x:  mx1-Vektor (theoretisch auch mxm Matrix möglich
%
% Rückgabewerte:
%   QTx:nx1-Vektor

[~,n] = size(QR);

QTx = x;
for k = 1:n
    % Stelle v_k aus der Matrix QR her (könnte sogar übersprungen werden)
    v = [1; QR(k+1:end,k)];
    % Passe QTx ab Zeile k an durch Multiplikation mit H_k=(I-tau_k v_k v_k')
    QTx(k:end,:) = QTx(k:end,:)-(tau(k)*v)*(v'*QTx(k:end,:));
endfor
endfunction