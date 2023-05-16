function [A,tau]=qr_householder(A)
% Berechnung der Zerlegung A=QR mittels Householder-Spiegelungen
%
% Eingabeparameter;
%   A:  mxn-Matrix mit m>=n
%
% Rückgabewerte:
%   A:  Veränderte mxn Matrix mit wobei in der oberen rechten Dreiecksmatrix die
%       Einträge von R gespeichert sind. Unterhalb der Diagonale sind die
%       Einträge der Vektoren v_k gespeichert.
%   tau:nx1-Vektor

% Abfrage der Dimension von A
[m,n] = size(A);

% Initialisierung von tau
tau = zeros(n,1);

% Algorithmus zu Householder (ohne Matrix-Matrix-Multiplikation)
for k=1:n     
  % Benutze nur die Elemente ab Index k: Speichereffizienz
  
  %Starte mit Spiegelung  
  % Setze dafür x als Vektor, bestehend aus der k-ten Spalte aus A ab
  % Diagonalelement.
  x=A(k:end,k);
  nr=norm(x,2);
  x1=x(1);
  
  % Prüfe, ob eine Spiegelung stattfinden muss, oder diese Spalte bereits gespiegelt ist
  % In Aufgabe 1.1 wurde genau das gemacht und die zweite
  % Spiegelung ausgelassen.
  if nr == abs(x(1))
      % Keine Spiegelung wird durchgeführt
      tau(k,1)=0; % tau=0 ist initialisiert, könnte also auch übersprungen werden
      continue
  else
    % "erster" Einheitsvektor
    e=zeros(m-k+1,1);
    e(1)=1;
    
    % Überprüfen, ob Diagonalelement Null ist: default wäre dann
    % sign(x1)=0. Im Algorithmus setzen wir allerdings sign(0)=1 voraus
    if x1==0
        c=nr;
    else
        c=sign(x1)*nr;
    end
    
    % Bestimmung von s, tau und v für H = I-tau*v*v’ (s. Algorithmus im Skript)
    s=x(1)+c;
    v=(x+(c*e))/s;
    tau(k,1)=abs(s)/nr;
  
    % Update A (Durchführung Householder-Spiegelung)
    A(k:end,k:n)=A(k:end,k:n)-tau(k,1)*v*(v'*A(k:end,k:n));
    A(k+1:end,k)=v(2:end,:);
  end
end
end
