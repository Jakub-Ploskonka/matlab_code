% Autor: Jakub Płoskonka
% 19.05.2025
% Analiza czasowo-częstotliwościowa sygnału audio – metoda Welcha (PSD)

clc; clear; close all;

% Wczytanie pliku audio
[x, fs] = audioread('czerwienszy_02_32_k.wav');

% Parametry
frame = 500;        % długość ramki
overlap = 250;      % zakładka (50%)
step = frame - overlap;
N = length(x);
czas = (0 : N-1) / fs;

% Dopełnienie zerami, jeśli trzeba
modulo = mod(N - overlap, step);
if modulo ~= 0
    z_amount = step - modulo;
    x = [x(:); zeros(z_amount, 1)];
end

% Nowa długość
N = length(x);
num_frames = floor((N - overlap) / step);

% Okno Hanninga i współczynnik normalizacyjny
win = hanning(frame);
WH = frame / sum(win);  % kompensacja tłumienia energii

% Macierz do gromadzenia wyników PSD
PSD_sum = zeros(frame, 1);

for q = 1:num_frames
    idx = (q-1)*step + 1 : (q-1)*step + frame;
    x_frame = x(idx) .* win;
    X_frame = fft(x_frame) * WH;
    
    PSD_frame = (abs(X_frame).^2) / frame;
    PSD_sum = PSD_sum + PSD_frame;
end

% Średnie PSD
PSD_avg = PSD_sum / num_frames;

% Tylko dodatnie częstotliwości (do fs/2)
f = (0:frame/2-1) * fs/frame;
PSD_half = PSD_avg(1:frame/2);


% Obliczanie FFT całego sygnału (dla porównania)
X_full = fft(x .* hanning(length(x)));  % opcjonalnie okno dla spójności
PSD_full = (abs(X_full).^2) / length(x);
PSD_full_half = PSD_full(1:frame/2);  % do fs/2

% Dopasowanie osi częstotliwości (przycięcie do tej samej długości)
f_full = (0:frame/2-1) * fs/frame;

% Wykres porównawczy: Welch vs FFT
figure (3);
hold on;
plot(f, 10*log10(PSD_half / max(PSD_half)), 'b', 'LineWidth', 2);
plot(f_full, 10*log10(PSD_full_half / max(PSD_full_half)), 'r--', 'LineWidth', 1.5);
grid on;
xlabel('Częstotliwość [Hz]');
ylabel('Moc [dB]');
title('Porównanie: Welch PSD vs. surowa FFT');
legend('Welch (średnie widmo)', 'Surowa FFT');

[Pxx_my, f_my] = myPeriodogram(x, fs);

figure(5)
plot(f_my, 10*log10(Pxx_my)); grid on;
xlabel('Częstotliwość [Hz]');
ylabel('PSD [dB/Hz]');
title('Periodogram własnej implementacji');



% Wykres PSD (Welch)

figure(1)
plot(x);
xlabel('czas [s]')
ylabel('amplituda');


figure(2)
plot(f, 10*log10(PSD_half / max(PSD_half)), 'b', 'LineWidth', 2);
xlabel('Częstotliwość [Hz]');
ylabel('Moc [dB]');
title('Widmo mocy (metoda Welcha)');
grid on;



function [Pxx, f] = myPeriodogram(x, fs)
    N = length(x);
    X = fft(x);                     % Transformata Fouriera
    X = X(1:N/2+1);                 % Tylko dodatnie częstotliwości (symetria FFT)
    Pxx = (1/(fs*N)) * abs(X).^2;  % Estymator gęstości mocy (skala jednostkowa)
    Pxx(2:end-1) = 2 * Pxx(2:end-1);% Korekta dla częstotliwości pośrednich
    f = fs * (0:N/2) / N;          % Odpowiadające częstotliwości
end
