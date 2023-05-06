% trisolve: Löst das Dreieckssystem Ax=b
%
% Eingabeparameter:
%
%   lower:  wenn true, dann undere Dreicksmatrix, sonst Obere 
%   M:      Matrix des Systems, mxn Matrix, m,n beliebig. Quadratische
%           Dreiecksmatrix A enthalten: 
%             |x x ... x |  |         |         |x 0 ... 0 ... 0| |       |
%             |0  .    . |  |  upper  |         |. .           .| |       |
%           M=|0     . . |= |         |  oder M=|.   .         .|=|lower ~|
%             |0       x |  |         |         |x x...x 0 ... 0| |       |
%             |0  .  . 0 |  |  ~      |    
%           oder bereits A in R^{nxn}
%   b:      Rechte Seite, l=min(m,n) lx1 Vektor
%
% Rückgabeparameter:
%   x:      Lösung des Systems


function x = trisolve(lower, A, b)
[m, n] = size(A);
l = min(m,n);

% Fehler, wenn Eingabematrix quadratisch, aber rechte Seite nicht die gleiche
% Dimension hat:
if (m == n) && (length(b)~= m)
    error('Die Dimensionen von A und b stimmen nicht ueberein.') 
endif

if (m==1) && (n == 1)
   x = b/A;
   return;
endif

% Setze rechte Seite
x = b(1:l);

if (lower)
    if (m > n)
    error('Das LGS ist überbestimmt.')
    endif
    for i = 1 : m
        for j = 1 : (i-1)
            x(i) = x(i) - A(i,j) * x(j); 
        endfor
        x(i) = x(i) / A(i,i); 
    endfor
else % upper
    if (m < n)
    error('Das LGS ist unterbestimmt.')
    endif
    for i = n : -1 : 1
        for j = n : -1 : (i+1) 
            x(i) = x(i) - A(i,j) * x(j); 
        endfor
        x(i) = x(i) / A(i,i); 
    endfor
endif

end
