% Autor: Jakub Ploskonka
% 03 2025
% Zadanie 3 Wygenerować sygnały ograniczone w czasie:
% a. sinus ograniczony oknem prostokątnym: amplituda 2, częstotliwość 2 Hz, czas trwania: 2 pełne okresy – t₀ = 0 – 4 pełne okresy,

% b. sinus ograniczony oknem trójkątnym: amplituda 4, częstotliwość 3 Hz, czas trwania: 1 pełny okres – t₀ = 0 – 6 pełnych okresów,

clc; clear; close all;

dt = 0.001;         % delta t
t = -2 : dt : 4;  % przedzial czasu
f_pr = 2;           % [Hz] czestotliwosc sin_pr
f_tr = 3;           % [Hz]czestotliwosc sin_tr
T_pr = 1/f_pr;      % okres sin_pr
T_tr = 1/f_tr;      % okres sin_tr
to = 0;
%t = -2 : dt : 4;  % przedzial czasu dla sin_pr

% sygnaly
% a)
s_sin_pr = 2 * sin(2*pi*f_pr*(t-to)) .*  prostokat((t-T_pr));
s_prost = 2 * prostokat((t-1)/2);
% b)
s_sin_tr = 4 * sin(2*pi*f_tr*(t-to)) .*  trojkat((t-3*T_tr));
s_trojk = 4 * trojkat((t-1)/2);
figure (1)

subplot(2,1,1)
plot(t,s_sin_pr, LineWidth= 2); grid on; hold on;
%plot(t,s_prost, LineWidth= 2);
title('Funkcja sin(t) i prostokat(t)');
xlabel('t (czas)'); ylabel('prostokat(t)');
hold on;
plot([min(t)-0.1 max(t)+0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_sin_pr)-0.1 max(s_sin_pr)+0.1], 'k--'); % oś Y

subplot(2,1,2)
plot(t,s_sin_tr, LineWidth= 2); grid on; hold on;
%plot(t,s_trojk, LineWidth= 2);
title('Funkcja sin(t) i trojkat(t)');
xlabel('t (czas)'); ylabel('trojkat(t)');
hold on;
plot([min(t)-0.1 max(t)+0.1], [0 0], 'k--'); % oś X
plot([0 0], [min(s_sin_tr)-0.1 max(s_sin_tr)+0.1], 'k--'); % oś Y

