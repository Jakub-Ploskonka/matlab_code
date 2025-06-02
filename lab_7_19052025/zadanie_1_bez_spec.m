% Autor Jakub Płoskonka
% 19 05 2025
% zadanie liczenie na piechote
% analiza czasowo-czestotliwosciowa sygnalu dzwiekowego z pliku WAV


clc; clear; close all;

% 1 Audioread czerwienszy
[x,fs]=audioread('czerwienszy_02_32_k.wav');

% 2 Audioread dzdzownica 2
%[x,fs]=audioread('dzdzownica_02_32_k.wav');

% 3 Audioread dzdzownica 3
%[x,fs]=audioread('dzdzownica_03_25_m.wav');

X = fft(x); % fft sygnalu

figure(1)

plot(x);
title('Wykres przebiegu czasowego sygnalu');
xlabel('Indeksy probek');
ylabel('Amplituda');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = length(x);
frame = 500; % dlugosc okna
overlap = 0; % nakladanie sie okien (100 probek)

modulo = mod(N, frame-2);
z_amount = frame - modulo; 
x = [x(:); zeros(z_amount,1)]; % dopełnienie zerami do wielokrotności rozmiaru okna
% Dzielimy sygnał na fragmenty (okna) długości frame=500 próbek z nakładaniem się 100 próbek.
% Jeżeli długość sygnału nie pozwala na pełne podziały, dopełniamy sygnał zerami.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dzielimy sygnał na okna
% Tworzymy macierz y, gdzie każdy wiersz to jedno okno sygnału.

Q = N / (frame-overlap);
a = frame - overlap;
for q = 1:Q-1
    y(q,:) = x((q-1) * a+1 : (q-1)*a+frame);
end

% Zastosowanie funkcji okna Hanninga
% Nakładamy funkcję Hanninga na każde okno, aby zmniejszyć efekt przecieków częstotliwościowych
% WH - współczynnik normalizacji energii (kompensuje tłumienie energii przez okno Hanninga)
WH = frame / sum(hanning(frame));
for q = 1:Q-1
    y_windowed(q,:) = y(q,:) .* hanning(frame)';
end

% Obliczanie FFT dla każdego okna

for q = 1 : Q-1
    y_DFT(q,:) = fft(y_windowed(q,:)) * WH;
end

% Budowanie macierzy widma i wyświetlanie spektrogramu
Y=[y_DFT.'];

figure(2)

imagesc(abs(Y));
set(gca, 'YTick')
set(gca, 'YDir', 'normal') % wartosci male na dole wykresy i do gory rosna
colormap('jet'); % kontrastowa mapa kolorow
colorbar;
xlabel('Okno czasowe nr');
ylabel('Indeks częstotliwości (FFT)');
% kolory to sila dzwieku na danej czestotliwosci

 %sound(x,fs); % dzwiek audio
