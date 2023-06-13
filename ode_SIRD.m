%%Funktion zum modellieren der SIRD-Differentialgleichung
%
% Input:    -   t              :   Zeitvariable
%           -   y              :   Differentialsvariable
%           -   parameter(1)   :   Ansteckungsrate
%           -   parameter(2)   :   Rate wieder gesund zu werden
%           -   parameter(3)   :   Rate wieder gesund zu werden ohne Immunitaetsbildung
%           -   parameter(4)   :   Sterblichkeitsrate
%
% Output:   -   dydt           :   ODE-System 
%
function dydt = ode_SIRD(t, y, parameter)

  dydt = zeros(size(parameter));

  S = y(1);
  I = y(2);
  R = y(3);
  D = y(4);
  
  dS = -parameter(1) * S * I + parameter(3)*R;

  dI = parameter(1) * S * I - parameter(2) * I - parameter(4) * I;

  dR = parameter(2) * I - parameter(3) * R;

  dD = parameter(4) * I;

  dydt = [dS, dI, dR, dD];

endfunction
