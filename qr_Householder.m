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
    
    x = A(k:end,k);
    nor = norm(x,2);
    x1 = x(1);
    
    if nor == abs(x1)
      tau(k,1) = 0;
      continue
    else

      e = zeros(m-k+1,1);
      e(1) = 1;

      if x1 == 0
        c = nor;
      else
        c=sign(x1)*nor;
      endif

      s = x(1) + c;
      
      v = (x + ( c * e ) ) / s;
      
      tau(k,1) = abs(s) / nor;
      
      A(k:end, k:n) = A(k:end, k:n) - tau(k,1) * v * (v'*(A(k:end,k:n)));
      
      A(k+1:end, k) = v(2:end,:);
    endif
      
  endfor
endfunction