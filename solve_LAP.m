%%Funktion zum loesen eines beschraenkten linearen Ausgleichproblems

% Input:    - A   :   gegebene mxn Matrix
%           - a   :   loesungsvektor von A mit Ax = a
%           - C   :   beschraenkende ixj Matrix
%           - c   :   loesungsvektor von C mit Cx = c

% Output:   - x   :   Loesungsvektor

function x = solve_LAP( A, a, C, c)
  
  % Bestimme QR-Zerlegung zu C
  [m,n] = size(C);
  nc = n;
  if m < n
    nc = m;
    C = C';
  endif
  
  [Qc_R, tau_c] = qr_Householder(C);
  
  % Bestimme Loesungskomponente x_1 mit R (inklusive trafo von x)
  Qc = triu(Qc_R(1:nc,:));
  x_1 = trisolve(1, Qc', c)';
   
  % Transformation von A mit [A1 A2] = AQc
  
  % Jetzt müsen wir [A_1 A_2] = A * Q_C berechnen und
  % korrekt aufteilen. Wir bauen [A * Q_C]^T = Q_c^T * A^T
  % auf, da wir hierzu nur matrix Vektor Produkte der Form
  % Q_c^T * [a_1 a_2 ... a_n] berechnen müssen mit
  % A^T = [a_1 a_2 ... a_n]
  % Das machen wir mit mult_QT
  % Anschließend transponieren wir das resultat
  % und erhalten das Produkt A * Q_C.
  % Wir splitten am Ende noch [A_1 A_2] = A * Q_C.
  prod = zeros(size(A,2));
  for i = 1: size(A,1)
    prod(:,i) = mult_QT(Qc_R, tau_c, A(i,:)');
  endfor
  prod = prod';
  A_1 = prod(:,1:nc);
  A_2 = prod(:,nc+1:end);
  
  a_0 = a - A_1*x_1';
  
  % Bestimme QR-Zerlegung zu A2 mit A2 = Qa_R mit R = [R1 0]T
  
  [Qa_R, tau_a] = qr_Householder(A_2);
  
  % Transformation von a_0: (a_1 a2)' = QaT*a0
  a = mult_QT(Qa_R, tau_a, a_0);
  
  % Bestimme Loesungskomponente x_a: R_1*x_a = a_1
  x_a = trisolve(1, Qa_R', a);
  
  % Transformation auf x: x = Qc * (x_1 x2)'
  x = mult_Q(Qc_R, tau_c, [x_1, x_a]');
  
endfunction