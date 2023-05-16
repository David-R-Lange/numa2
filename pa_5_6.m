% Programmieraufgabe 5.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 6.4.0-2
%
% Liste der eingesendeten Dateien:
%   1.  qr_algorithm.m
%   2.  qr_householder.m
%   3.  mult_QT.m
%
%
% Housekeeping
clc;
clear;
tic;    # start clock

% Anfang des Skriptes

tol = 1e-8;
max_iter = 10000;

A = [4,3,0 ; 3,4,0 ; 0,28/15,1];

B = [1,-1,-1 ; 4,6,3 ; -4,-4,-1];

C = [4,0,0,0 ; 1,2,0,0 ; 1,0,6-3*i,0 ; 1,0,0,42];

[lambda1, iter] = qr_algorithm(A, tol, max_iter)

[lambda2, iter] = qr_algorithm(B, tol, max_iter)

# Frage:    Vergleichen Sie die Iterationszahlen fuer die Matrizen A und B, was faellt auf?
#           Woran koennten die unterschiedlichen Iterationszahlen liegen? Wie koennte das
#           Programm verbessert werden?
#
# Antwort:  Es faellt auf, dass die EW Approx. von A sehr viele Schritte durchlaeuft, waehrend B keine 100 Schritte braucht
#           WORAN? TODO
#           Dass Programm koennte man schneller abbrechen lassen, indem wir den alten lambdawert speichern und diesen gegen
#           den neu berechneten Wert vergleichen und wenn die absolute Differenz dieser beiden Werte kleiner als unsere tol 
#           waere, koennte man die approx. abbrechen lassen.

[lambda3, iter] = qr_algorithm(C, tol, max_iter)

# Frage:    Funktioniert das Verfahren auch fuer die komplexwertige Matrix C /elementof /C^nxn ?
#
# Antwort:  Da die Diagonalelemente schon die EW der Matrix sind, passiert mit denen in der Ausfuehrung
#           auch gar nichts. Somit funktioniert das Verfahren nicht fuer diese Matrix, in dem Sinne, dass
#           es unnoetig ist.

[lambda4, iter] = qr_algorithm(C', tol, max_iter)

# Frage:    Wie viele Iterationen werden fuer D = C' benoetigt?
#           Weshalb koennen wir kein anderes Ergebnis erwarten?
#
# Antwort:  D wird nur eine Iteration durchgehen, da laut Abbruchkriterium die untere
#           dreiecksmatrix (quasi die v-vektoren von Q aus der QR-Zerlegung), verglichen wird 
#           mit < tol*norm(A,inf). Dies wird immer der Fall sein, da tril(A,1) = 0.

toc #end clock