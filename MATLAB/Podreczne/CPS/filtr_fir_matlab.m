% Parametry filtru
fp = 10; % Częstotliwość końca pasma przepustowego (Hz)
fr = 15; % Częstotliwość początku pasma zaporowego (Hz)
Rr = 40;   % Minimalne wymagane tłumienie w paśmie zaporowym (dB)
fs = 50; % Częstotliwość próbkowania (Hz)

% Obliczenie filtru FIR
R = 100; % Długość filtru (możesz dostosować)
K = R+1;
b = fir1(n, [fp, fr] * 2 / fs, 'bandpass', hamming(K));

% Wyświetlenie charakterystyki filtru
figure(1)
freqz(b, 1, 512, fs);
title('Charakterystyka filtru FIR');

figure(2)
stem(b); grid on;
% Możesz dostosować długość filtru (n) i okno (np. kaiser) według swoich potrzeb.
