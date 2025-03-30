% zadanie_1.m
% Autor: Jakub Ploskonka
% 24 03 2025
% Zadanie 1
% syg_sin ograniczony oknem prostoktnym

% Dane wejsciowe
% k - liczba pelnych okresow symetrycznych wzgledem to = 0
% fo - czestotliwosc syg sinusoidalnego
% fs - czestotliwosc probkowania

% Dane wyjsciowe
% s - wygenerowany sygnal "analogowy"
% x - sygnal cyfrowy "sprobkowany sygnal analogowy s"
% sa - odtworzony sygnal "analogowy" z tw Shanona

clc; clear; close all;

% Parametry
k = 3;
fo = 1000; % [Hz]

% SYGNAL ANALOGOWY
dt = 10e-6;
t = -(k+1)/fo : dt : (k+1)/fo;  % k+1 zedy widac bylo okno prostokatne

s = syg_sin(t,k,fo);

figure(1)
plot(t,s,LineWidth=2); grid on; hold on;
title('sinus ograniczony oknem prostokatnym');
xlabel('t (czas)'); ylabel('sygnal sin(k,fo)');

% analogowy
function s = syg_sin(t,k,fo)

s = sin(2 * pi * fo * t);

okno = zeros(1,length(t));
okno(abs(t)<(k/fo))=1;

s = s .* okno;

end
