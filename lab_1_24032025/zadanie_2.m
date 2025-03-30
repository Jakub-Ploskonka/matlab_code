% zadanie_2.m
% Autor: Jakub Ploskonka
% 24 03 2025
% Zadanie 2
% syg_sin ograniczony oknem prostoktnym + próbkowanie 

% Dane wejsciowe
% k - liczba pelnych okresow symetrycznych wzgledem to = 0
% fo - czestotliwosc syg sinusoidalnego
% fs - czestotliwosc probkowania

% Dane wyjsciowe
% s - wygenerowany sygnal "analogowy"
% x - sygnal cyfrowy "sprobkowany sygnal analogowy s"
% sa - odtworzony sygnal "analogowy" z tw Shanona

% ts = 1/fs     

clc; clear; close all;

% Parametry
k = 3;
fo = 1000; % [Hz]

% SYGNAL ANALOGOWY
dt = 10e-6;
t = -(k+1)/fo : dt : (k+1)/fo;  % k+1 zedy widac bylo okno prostokatne
% (k+1)/fo = 4/1000
s = syg_sin(t,k,fo);

% SYGNAL PROBKOWANY
N = 30;
n = -15 : N - 16;
fs = 5000;
ts = n / fs;

x = syg_sin(ts,k,fo);


figure(1)
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
title('Sygnal s(t) oraz sprobkowany sygnal x');
xlabel('t (czas)'); ylabel('Amplituda');



function s = syg_sin(t,k,fo)

s = sin(2 * pi * fo * t);

okno = zeros(1,length(t));
okno(abs(t)<(k/fo))=1;

s = s .* okno;

end