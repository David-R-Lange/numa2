%%Funktion um eine gegebene mxn Matrix zu Faktorisieren
%
%   Input:  A   :   Gegebene mxn Matrix
%
%   Output: A   :   Überschriebene und Faktorisierte mxn Matrix
%           tau :   Koeffizienten Vektor zum bilden der Matrix Q

function [A, tau] = qr_Householder(A)
  
  [m,n] = size(A);
  
  if m < n
    error('Fehler -  Die Dimensionen von der gegebenen Matrix sind Falsch. m < n');
  endif
  
  tau = zeros(n,1);
  
  
  for k=1:n
    
    x = zeros(m,1);
    x(k:m,1) = A(k:end,k);
    
    nor = norm(x);
    s = x(k) + sign(x(k))*nor;
    
    e = zeros(m,1);
    e(k) = 1;
    
    v = zeros(m,1);
    
    v = (x .+ sign(x(k))*nor * e ) / s;
    
    tau(k) = abs(s) / nor;
    
    u = transpose(v)*A;  %u ist ein zeilenvektor
    
    A = A - tau(k)*v*u;  %keine Matrix-Matrix-Mult.
    
    A(k+1:end, k) = v(k+1:end);
    
  endfor
endfunction