% zadanie_3.m
% Autor: Jakub Ploskonka
% 31 03 2025
% Zadanie 3
% syg_sin ograniczony oknem prostoktnym + widmo CFT sygnału 

clc; clear; close all;

% Parametry
k = 3;
fo = 1000;       % [Hz] – częstotliwość sygnału
fs = 100000;     % [Hz] – bardzo gęste próbkowanie (do przybliżenia CFT)
dt = 1/fs;       % okres próbkowania

% Czas: większy niż okno prostokątne, by dobrze uchwycić brzeg
t = -(k+1)/fo : dt : (k+1)/fo;

% Sygnał sinusoidalny ograniczony oknem
s = sin(2 * pi * fo * t);
okno = abs(t) < (k / fo);
s = s .* okno;

% FFT – przybliżenie CFT
N = length(s);
S = fftshift(fft(s, 10*N)); % zwiększamy rozdzielczość FFT
f = linspace(-fs/2, fs/2, length(S));

% Widmo amplitudowe
mag = abs(S) / max(abs(S));  % normalizacja

% Wykres
figure(1)
plot(f, mag, 'LineWidth', 2); grid on;
title('Widmo amplitudowe sygnału sinus ograniczonego czasowo');
xlabel('Częstotliwość [Hz]');
ylabel('|S(f)| / max');
xlim([-3*fo, 3*fo]);  % pokazujemy ±3fo dla czytelności
