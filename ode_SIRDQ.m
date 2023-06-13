%%Funktion zum modellieren der SIRDQ-Differentialgleichung
%
% Input:    -   t               :   Zeitvariable
%           -   y               :   Differentialvariable
%           -   parameter(1)    :   Ansteckungsrate
%           -   parameter(2)    :   Rate wieder gesund zu werden
%           -   parameter(3)    :   Rate wieder gesund zu werden ohne Immunitaetsbildung
%           -   parameter(4)    :   Sterblichkeitsrate
%           -   parameter(5)    :   Quarantaenerate
%
% Output:   -   dydt            :   ODE-System
%
function dydt = ode_SIRDQ(t, y, parameter)
 
  dydt = zeros(size(parameter));

  S = y(1);
  I = y(2);
  R = y(3);
  D = y(4);
  Q = y(5);

  dS = -parameter(1) * S * I + parameter(3) * R;
  dI = parameter(1) * S * I - parameter(5) * I;
  dQ = parameter(5) * I - parameter(2) * Q - parameter(4) * Q;
  dR = parameter(2) * I - parameter(3) * R;
  dD = parameter(4) * I;

  dydt = [dS, dI, dR, dD, dQ];
endfunction
