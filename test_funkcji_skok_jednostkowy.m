% Autor: Jakub Ploskonka
% 03 2025
% Wykorzystanie funkcji skok_jednostkowy

clc; clear; close all;

dt = 0.001;                 % delta t
t  = -5 : dt : 5;           % czas/zakres

s_t = skok_jednostkowy(t,1);     % sygnal 

figure (1)
plot(t,s_t, LineWidth= 2); grid on;
title('Funkcja skok_jednostkowy(t)');
xlabel('t (czas)'); ylabel('skok_jednostkowy(t)');
hold on;
plot([min(t) - 0.2 max(t) + 0.2], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t)-0.2 max(s_t)+0.2], 'k--'); % oś Y