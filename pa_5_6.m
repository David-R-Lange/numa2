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

format long;

A = [4,3,0 ; 3,4,0 ; 0,28/15,1];

B = [1,-1,-1 ; 4,6,3 ; -4,-4,-1];

C = [4,0,0,0 ; 1,2,0,0 ; 1,0,6-3*i,0 ; 1,0,0,42];

[lambda1, iter] = qr_algorithm(A, 0, tol, max_iter)

[lambda2, iter] = qr_algorithm(B, 0, tol, max_iter)

# Frage:    Vergleichen Sie die Iterationszahlen fuer die Matrizen A und B, was faellt auf?
#           Woran koennten die unterschiedlichen Iterationszahlen liegen? Wie koennte das
#           Programm verbessert werden?
#
# Antwort:  Es faellt auf, dass die EW Approx. von A sehr viele Schritte (3007) durchlaeuft, waehrend B kaum 20 Schritte 
#           braucht. 
#           Dies kann daran liegen, dass A einen doppelten EW hat, naemlich 1. Dadurch ist die Konvergenz des leichten QR-Verfahrens
#           nicht mehr linear und dies erklaert unseren viele Schritte. 
#           Man koennte Shifts in das Verfahren einbauen, womit die Konvergenz des Systems schneller erreicht wird. Andernfalls
#           koennte man auch vorher die Matrizen auf die Obere Hessenberg Form bringen, dies wuerde die Konvergenz auch erhoehen,
#           aber eine Berechnung im Vorhinein bedeuten.

[lambda3, iter] = qr_algorithm(C, 0, tol, max_iter)

# Frage:    Funktioniert das Verfahren auch fuer die komplexwertige Matrix C /elementof /C^nxn ?
#
# Antwort:  Da die Diagonalelemente schon die EW der Matrix sind, passiert mit denen in der Ausfuehrung
#           auch gar nichts. Somit funktioniert das Verfahren nicht fuer diese Matrix, in dem Sinne, dass
#           es unnoetig ist.

[lambda4, iter] = qr_algorithm(C', 0, tol, max_iter)

# Frage:    Wie viele Iterationen werden fuer D = C' benoetigt?
#           Weshalb koennen wir kein anderes Ergebnis erwarten?
#
# Antwort:  D wird nur eine Iteration durchgehen, da laut Abbruchkriterium die untere
#           dreiecksmatrix (quasi die v-vektoren von Q aus der QR-Zerlegung), verglichen wird 
#           mit < tol*norm(A,inf). Dies wird immer der Fall sein, da tril(A,1) = 0.

[lambda5, iter] = qr_algorithm(A, 1, tol, max_iter)   # zum Vergleich wird hier das "QR-Verfahren mit Shift" genutzt
                                                      # um die Aufgabe viel schneller zu loesen. (Siehe Frage 1)

toc #end clock