% Matlab-Einfuehrung Numerische Mathematik 2, SoSe 2023
% Senta Lange, IfAM, Uni Hannover
%
% Plot: Mehrere Möglichkeiten

% Gitter zum Plotten der Funktion und Auswerten der Funktionswerte
x = -1:0.05:1;
y1 = sin(x);
y2 = exp(x);

%plotten
figure(1);
plot(x,y1,'k--',x,y2,'bx')
legend('exp','sin');

%mit hold on...hold off
figure(2);
plot(x,y1,'k--' ) % sin(x) in schwarz und gestrichelt plotten
hold on  
scatter(x,y2,'b','x') % einzelne Kreuze in blau plotten
legend('exp','sin');
hold off 
