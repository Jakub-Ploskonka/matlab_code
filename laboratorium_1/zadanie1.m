% Autor: Jakub Ploskonka
% 03 2025
% Zadanie 1 Napisać funkcje generujące sygnały elementarne (interpretacja analogowa):
% impuls prostokątny
% impuls trójkątny
% skok jednostkowy

clc; clear; close all;

dt = 0.001;
t = -5 : dt: 5;

% sygnaly
s_prostokatny = prostokat(t);
s_trojkatny = trojkat(t);
s_skok_jednostkowy = skok_jednostkowy(t);

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