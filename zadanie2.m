% Autor: Jakub Ploskonka
% 03 2025
% Zadanie 2 Zaprezentować operacje wzmocnienia, skalowania i przesunięcia na sygnałach

clc; clear; close all;

dt = 0.001;
t = -5 : dt: 5;

% wsp  prostokat
wzmocnienie_pr = 1; % amplituda
przesuniecie_pr = 2;
skalowanie_pr = 4; % rozciaganie, sciskanie

% wsp  trojkat
wzmocnienie_tr = 1; % amplituda
przesuniecie_tr = -1;
skalowanie_tr = 3; % rozciaganie, sciskanie

% wsp  skok_jednostkowy
wzmocnienie_sj = 1; % amplituda
przesuniecie_sj = -1;
skalowanie_sj = 3; % rozciaganie, sciskanie

% sygnaly
s_prostokatny = wzmocnienie_pr * prostokat((t-przesuniecie_pr)/skalowanie_pr);
s_trojkatny = wzmocnienie_tr * trojkat((t-przesuniecie_tr)/skalowanie_tr);
s_skok_jednostkowy = wzmocnienie_sj * skok_jednostkowy((t-przesuniecie_sj)/skalowanie_sj);

figure (1)

subplot(3,1,1)
plot(t,s_prostokatny, LineWidth= 2); grid on;
title('Funkcja prostokat(t)');
xlabel('t (czas)'); ylabel('prostokat(t)');
hold on;
plot([min(t) - 0.2 max(t) + 0.2], [0 0], 'k--'); % oś X
plot([0 0], [min(s_prostokatny)-0.2 max(s_prostokatny)+0.2], 'k--'); % oś Y

subplot(3,1,2)
plot(t,s_trojkatny, LineWidth= 2); grid on;
title('Funkcja trojkat(t)');
xlabel('t (czas)'); ylabel('trojkat(t)');
hold on;
plot([min(t) - 0.2 max(t) + 0.2], [0 0], 'k--'); % oś X
plot([0 0], [min(s_trojkatny)-0.2 max(s_trojkatny)+0.2], 'k--'); % oś Y

subplot(3,1,3)
plot(t,s_skok_jednostkowy, LineWidth= 2); grid on;
title('Funkcja skok_jednostkowy(t)');
xlabel('t (czas)'); ylabel('skok_jednostkowy(t)');
hold on;
plot([min(t) - 0.2 max(t) + 0.2], [0 0], 'k--'); % oś X
plot([0 0], [min(s_skok_jednostkowy)-0.2 max(s_skok_jednostkowy)+0.2], 'k--'); % oś Y