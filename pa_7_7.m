% Programmieraufgabe 7.7
% Liste der Gruppenmitglieder (Name, Matrikelnummer)
%   1.  Rene-David Brüggemann, 10040204
%   2.  Jean-Luc Brüggemann, 10048805
%   3.  Kilian Hartmann, 10031802
%
% Programmiersprache: Octave
% Version:            version 7.3.0
%
% Liste der eingesendeten Dateien:
%   1.  ode_SIRD.m
%   2.  ode_SIRDQ.m
%
% Housekeeping
clc;
clear all;
close all;
tic;    % start clock

% Anfang des Skriptes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Modellierung des Ebola-Virus Ausbruchs in Zaire von 1976    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definition der Parameter fuer die Korrekte Simulation gegeben nach "Mathematical Modelling of the Transmission Dynamics of Ebola Virus" by Amenaghawon C Osemwinyen and Aboubakary Diakhaby
delta = 0.73;
beta = 0.27;
gamma = 0.23;
alpha = 3.15e-5;
alpha_q = 8.7e-6;
omega = 0.75;

% Definition von unserem Anfangswert y_0
N_0 = 125000; 

I_0 = 5;

y_0 =  [N_0 - I_0, I_0, 0, 0];

% Definition von den gegebenen Zeiten t_0 und t_max
t_0 = 0;

t_max = 30;

%% Nutzen des SIRD-Modells

% Loesen des ersten Systems von Differentialgleichungen
[t, y] = ode45(@(t, y) ode_SIRD(t, y, [alpha, beta, gamma, delta]), [t_0, t_max], y_0);

figure(1);

% Plot (1) von der Loesung

plot1 = plot(t, y(:,1), "--", t, y(:,2), "-." ,t,  y(:,3), "*",t, y(:,4)); 

% Verschoenern des Plots (1) nach dem Schema vom Paper

title("The Zaire Ebola Virus Solution Model");
xlabel("Time in days");
ylabel("Population Values");
legend("Susceptible", "Infected", "Recovered", "Deceased");

%% Nutzen des SIRDQ-Modells

% Erweiterung des Anfangswertes mit Q = 0;
y_0 = [y_0, 0];

% Loesen des Systems von Differentialgleichungen
[t_q, y_q] = ode45(@(t, y) ode_SIRDQ(t, y, [alpha_q, beta, gamma, delta, omega]), [t_0, t_max], y_0);

% Plot (2) der Loesung 

figure(2);

plot2 = plot(t_q, y_q(:,1), "--", t_q, y_q(:,2), "-.",t_q ,  y_q(:,3), "*",t_q , y_q(:,4),t_q, y_q(:,5));

% Verschoenern des Plots (2) nach dem Schema vom Paper 

title("The Zaire Ebola Virus Solution Model");
xlabel("Time in days");
ylabel("Population Values");
legend("Susceptible", "Infected", "Recovered", "Deceased", "Quarantined");

toc
