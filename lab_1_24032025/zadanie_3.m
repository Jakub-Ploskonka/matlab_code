% zadanie_3.m
% Autor: Jakub Ploskonka
% 24 03 2025
% Zadanie 3
% syg_sin ograniczony oknem prostoktnym + próbkowanie + odtwarzanie z tw. Shannona 

% Twierdzenie Shannona (Nyquista)
% fs >= 2*fo

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
N = 50;
n = -25 : N-26;
fs = 5000;
ts = n / fs;

x = syg_sin(ts,k,fo);

% 
% S = fft(s); % DFT           NIE JEST ZNORMALIZOWANE AMPLITUDA MA BYĆ 1
% S_shifted = fftshift(S);
% widmo_amp = 2 * abs(S_shifted);
% N = length(S);
% df = fs / N;
% f = (-N/2 : (N/2)-1) * df;

% SYGNAL ODTWORZONY
s_odtw = zeros(1,length(t));
N = 50;
for i = 1 : N
    s_odtw = s_odtw + x(i) .* sinc(fs * (t - n(i) .* (1/fs)));
end


% Wykresy
figure(1)
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
title('Sygnal s(t) oraz sprobkowany sygnal x');
xlabel('t (czas)'); ylabel('Amplituda');

figure(2)
plot(t,s_odtw,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
title('Sygnal s(t) odtworzony z próbek ');
xlabel('t (czas)'); ylabel('Amplituda');

figure(3)
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
plot(t,s_odtw,'g-',LineWidth=2); grid on; hold on;
title('Sygnal s(t) oraz sprobkowany sygnal x');
xlabel('t (czas)'); ylabel('Amplituda');
legend('s(t)','x(n)','s_odtw');

% figure(4)
% plot(f,widmo_amp,'b-',LineWidth=2); grid on; hold on;
% plot(f, widmo_amp);
% xlabel('Częstotliwość (Hz)');
% ylabel('Amplituda');
% title('Widmo sygnału s(t) od -fs/2 do fs/2');
% grid on;


% funkcja syg_sin(t,k,fo)
function s = syg_sin(t,k,fo)

s = sin(2 * pi * fo * t);

okno = zeros(1,length(t));
okno(abs(t)<(k/fo))=1;

s = s .* okno;

end