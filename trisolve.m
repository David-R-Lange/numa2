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
end

if (m==1) && (n == 1)
   x = b/A;
   return;
end

% Setze rechte Seite
x = b(1:l);

if (lower)
    if (m > n)
    error('Das LGS ist überbestimmt.')
    end
    for i = 1 : m
        for j = 1 : (i-1)
            x(i) = x(i) - A(i,j) * x(j); 
        end
        x(i) = x(i) / A(i,i); 
    end
else % upper
    if (m < n)
    error('Das LGS ist unterbestimmt.')
    end
    for i = n : -1 : 1
        for j = n : -1 : (i+1) 
            x(i) = x(i) - A(i,j) * x(j); 
        end
        x(i) = x(i) / A(i,i); 
    end
end

end
