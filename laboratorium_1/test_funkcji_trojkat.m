% Autor: Jakub Ploskonka
% 03 2025
% Wykorzystanie funkcji trojkatnej

clc; clear; close all;

dt = 0.001;                 % delta t
t  = -5 : dt : 5;           % czas/zakres

s_t = trojkat(t);     % sygnal 

figure (1)
plot(t,s_t, LineWidth= 2); grid on;
title('Funkcja trojkatna trojkat(t)');
xlabel('t (czas)'); ylabel('trojkat(t)');
hold on;
plot([min(t) - 0.2 max(t) + 0.2], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t)-0.2 max(s_t)+0.2], 'k--'); % oś Y