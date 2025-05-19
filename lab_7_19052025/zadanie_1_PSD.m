% Autor Jakub Płoskonka
% 19 05 2025
% zadanie z uzyciem funkcji spectrogram + PSD
% analiza czasowo-czestotliwosciowa sygnalu dzwiekowego z pliku WAV

clc; clear; close all;
% 1 Audioread czerwienszy
[x,fs]=audioread('czerwienszy_02_32_k.wav');

% 2 Audioread dzdzownica 2
%[x,fs]=audioread('dzdzownica_02_32_k.wav');

% 3 Audioread dzdzownica 3
%[x,fs]=audioread('dzdzownica_03_25_m.wav');

N = length(x);
czas = (0 : N-1) / fs ;
frame = 1000;
window = hamming(frame)';
overlap = 0;

[S,f,t] = spectrogram(x, window, overlap, frame, fs);
density = zeros(1,length(f));

% Średnia amplituda na częstotliwości
for i = 1:length(f)
%density(i) = sum(abs(S(i,:)))/frame; % wyznaczam średnią amplitudę każdej częstotliwości
density(i) = mean(abs(S(i,:)) .^ 2);
end

figure(1)
    plot(czas,x);
    xlabel('Czas [s]');
    ylabel('Amplituda');

figure(2)

subplot(2,1,1)
    imagesc(f,t,abs(S));
    set(gca, 'YDir', 'normal')
    colorbar
    xlabel('Czestotliwosc [Hz]');
    ylabel('Czas [s]');

subplot(3,1,3);
    grid on; hold on;
    plot(0 : fs/N : fs-fs/N, 10*log10(abs(fft(x)) / N/max(x)),'r-'); % surowa FFT
    xlim([0,fs/2]);
    plot(f, 10*log10(density/max(density)),'b-', 'LineWidth',2);
    xlabel('Czestotliwosc [Hz]');
    ylabel('FFT / PSD')
    legend('FFT ', 'Estymowana PSD');


