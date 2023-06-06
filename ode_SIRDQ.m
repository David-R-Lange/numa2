%%Funktion zum modellieren der SIRDQ-Differentialgleichung
%
% Input:    -   t       :   Zeitvariable
%           -   y       :   Differential
%           -   alpha   :   Ansteckungsrate
%           -   beta    :   Rate wieder gesund zu werden
%           -   gamma   :   Rate wieder gesund zu werden ohne Immunitaetsbildung
%           -   delta   :   Sterblichkeitsrate
%           -   omega   :   Quarantaenerate
%
% Output:   -   dydt    :   
%
function dydt = ode_SIRDQ(t, y, alpha, beta, gamma, delta, omega)

endfunction