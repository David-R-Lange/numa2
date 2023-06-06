%%Funktion zum modellieren der SIRD-Differentialgleichung
%
% Input:    -   t       :   Zeitvariable
%           -   y       :   Differential
%           -   alpha   :   Ansteckungsrate
%           -   beta    :   Rate wieder gesund zu werden
%           -   gamma   :   Rate wieder gesund zu werden ohne Immunitaetsbildung
%           -   delta   :   Sterblichkeitsrate
%
% Output:   -   dydt    :   
%
function dydt = ode_SIRD(t, y, alpha, beta, gamma, delta)
    
endfunction