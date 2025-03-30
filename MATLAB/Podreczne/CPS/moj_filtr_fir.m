% Parametry filtru
fp = 10; % Częstotliwość końca pasma przepustowego (Hz)
fr = 15; % Częstotliwość początku pasma zaporowego (Hz)
Rr = 40;   % Minimalne wymagane tłumienie w paśmie zaporowym (dB)
fs = 50; % Częstotliwość próbkowania (Hz)

% Obliczenie częstotliwości granicznych w jednostkach cyfrowych
wp = 2 * pi * fp / fs;
wr = 2 * pi * fr / fs;

% Obliczenie parametrów okna Hamminga
R = 100; % Długość filtru (możesz dostosować)
K = R+1;
window = hamming(K);

% Obliczenie współczynników filtru FIR
h = zeros(1, K);
for k = 0:n
    if k == n / 2
        h(k + 1) = (wp + wr) / pi;
    else
        h(k + 1) = (sin(wr * (k - n / 2)) - sin(wp * (k - n / 2))) / (pi * (k - n / 2));
    end
    h(k + 1) = h(k + 1) * window(k + 1);
end

% Wyświetlenie charakterystyki filtru
freqz(h, 1, 512, fs);
title('Charakterystyka mojego filtru FIR');

% Możesz dostosować długość filtru (n) i okno (np. hamming) według swoich potrzeb.
