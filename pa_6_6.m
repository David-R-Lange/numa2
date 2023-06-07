% Programmieraufgabe 6.6
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  svd_approx.m
%   2.  matrix.mat
%   3.  matrix_1.mat
%   4.  matrix_2.mat
%   5.  matrix_3.mat
%
%
% Housekeeping
clc;
clear all;
close all;
tic;    # start clock

% Anfang des Skriptes

#### Beginn mit der Kompression des ersten Bildes ######

matrix = importdata('matrix.mat');          # Laden der Bilddatei

nu = [3, 10, 20];                # Def. der gegebene nu's


####  Kompression des Bildes mit der Methode svd_approx ####

figure (1);

subplot(2,2,1), imshow(matrix)
  xlabel (sprintf("Keine Kompression"));

C = svd_approx(matrix, nu(1));

subplot(2,2,2), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(1)));

C = svd_approx(matrix, nu(2));

subplot(2,2,3), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(2)));

C = svd_approx(matrix, nu(3));

subplot(2,2,4), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(3)));


##  Naechste Bildatei ####

nu = [3, 30, 60];                           # Def. von nu fuer die anderen Matrizen

matrix = importdata('matrix_1.mat');        # Laden der Bildatei #1

##  Kompression ####

figure (2);

subplot(2,2,1), imshow(matrix)
  xlabel (sprintf("Keine Kompression"));

C = svd_approx(matrix, nu(1));

subplot(2,2,2), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(1)));

C = svd_approx(matrix, nu(2));

subplot(2,2,3), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(2)));

C = svd_approx(matrix, nu(3));

subplot(2,2,4), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(3)));




####  Naechste Bildatei ####
    
matrix = importdata('matrix_2.mat');      # Laden der Bildatei #2

####  Kompression ####

figure(3);

subplot(2,2,1), imshow(matrix)
  xlabel (sprintf("Keine Kompression"));

C = svd_approx(matrix, nu(1));

subplot(2,2,2), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(1)));

C = svd_approx(matrix, nu(2));

subplot(2,2,3), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(2)));

C = svd_approx(matrix, nu(3));

subplot(2,2,4), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(3)));


#### Naechste Bildatei  ####

matrix = importdata('matrix_3.mat');      # Laden der Bildatei #3

####  Kompression ####

figure(4);

subplot(2,2,1), imshow(matrix)
  xlabel (sprintf("Keine Kompression"));

C = svd_approx(matrix, nu(1));

subplot(2,2,2), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(1)));

C = svd_approx(matrix, nu(2));

subplot(2,2,3), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(2)));

C = svd_approx(matrix, nu(3));

subplot(2,2,4), imshow(C)
xlabel(sprintf("Kompression mit Rang(A) = r = %d", nu(3)));

toc