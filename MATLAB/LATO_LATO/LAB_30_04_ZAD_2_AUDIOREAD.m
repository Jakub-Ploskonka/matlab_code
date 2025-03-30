% CPS AUDIOREAD 
% Jakub PŁOSKONKA
% LAB_30_04_2024
% zad 1
clc; clear; close all;

[x , fs] = audioread('czerwienszy_02_32_k.wav');

do = 256; % długosc okna
po = do/2; % przesuniecie okna

nf=2^8; %ilosc probek w fft

% generowanie spektrogramu
[S, f, t] = my_spectrogram(x,do,po,nf,fs);

[S1, f1,t] = stft(x,fs, Window=hamming(256));

% generowanie periodogramu

N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/length(x):fs/2;

figure(3)
plot(freq,pow2db(psdx))
grid on
title("Periodogram uzywajac DFT")
xlabel("Frequency (Hz)")
ylabel("Power/Frequency (dB/Hz)") 



% wykresy
figure(1)

    imagesc(t, f, 20*log10(abs(S)));
    axis xy; % Inwersja osi Y
    xlabel('Czas [s]');
    ylabel('Częstotliwość [Hz]');
    title('STFT CZERWIENSZY - MÓJ');
    colorbar; % Dodanie kolorowej skali

figure(2)
    imagesc(t, f1, 20*log10(abs(S1)));
    axis xy; % Inwersja osi Y
    xlabel('Czas [s]');
    ylabel('Częstotliwość [Hz]');
    title('STFT CZERWIENSZY - MATLABOWY');
    colorbar; % Dodanie kolorowej skali