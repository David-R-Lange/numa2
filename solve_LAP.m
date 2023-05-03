%%Funktion zum loesen eines beschraenkten linearen Ausgleichproblems

% Input:    - A   :   gegebene mxn Matrix
%           - a   :   loesungsvektor von A mit Ax = a
%           - C   :   beschraenkende ixj Matrix
%           - c   :   loesungsvektor von C mit Cx = c

% Output:   - x   :   Loesungsvektor

function x = solve_LAP( A, a, C, c)
  
  % Bestimme QR-Zerlegung zu C
  [m,n] = size(C);
  if m < n
    C = C';
  endif
  
  [QcR, tau_c] = qr_Householder(C);
  
  % Bestimme Loesungskomponente x1 mit R (inklusive trafo von x)
  x1 = trisolve(1, triu(QcR)', c);
   
  % Transformation von A mit [A1 A2] = AQc
  
  a0 = a - mult_QT(QcR'*A', tau_c, x1);
  
  % Bestimme QR-Zerlegung zu A2 mit A2 = QaR mit R = [R1 0]T
  
  [QaR, tau_a] = qr_Householder(A2);
  
  % Transformation von a0: (a1 a2)' = QaTa0
  a1_2 = mult_QT(QaR, tau, a0);
  
  % Bestimme Loesungskomponente x_a: R1x_a = a1
  x_a = trisolve(0, triu(QaR), a1);
  
  % Transformation auf x: x = Qc * (x1 x2)'
  
  x = mult_Q(Qc, tau_c, [x1 x_a]);
  
  
endfunction