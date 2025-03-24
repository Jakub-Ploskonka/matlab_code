% Autor: Jakub Ploskonka
% 03 2025
% Wykorzystanie funkcji sinc() oraz funkcji sin() do wykreslenia sinc

clear; close all; clc;


dt = 0.001;
t = -10 : dt : 10;

s_t_sin = sin(pi*t) ./ (pi*t);
s_t = sinc(t);


figure (1)
subplot(2,1,1)
plot(t,s_t, LineWidth=2); grid on; hold on;
title('Funkcja sinc(t) MATLABOWA');
xlabel('t (czas)'); ylabel('sinc(t)');
hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t)-0.1 max(s_t)+0.1], 'k--'); % oś Y

subplot(2,1,2)
plot(t,s_t_sin, LineWidth=2); grid on;
title('Funkcja sinc(t) z uzyciem sin');
xlabel('t (czas)'); ylabel('sin(pi*t) ./ pi*t');
hold on;
plot([min(t) - 0.1 max(t) + 0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_t)-0.1 max(s_t)+0.1], 'k--'); % oś Y