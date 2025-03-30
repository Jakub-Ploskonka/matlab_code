% lab 6
% zad 2
clc; clear; close all;

load STFT_02.mat; % Zaimportuj funkcję lub skrypt z pliku .p

do = 256; % długosc okna
po = do/2; % przesuniecie okna

nf=2^8; % ilosc probek w fft

% Wygeneruj spektrogram
[s1, f1, t1] = spectrogram(x,do, po,nf,fs);
[s, f, t] = spektrogrammm(x,do,po,nf,fs);


%Wyświetl spektrogram
figure(1)
    imagesc(t, f, 20*log10(abs(s)));
    axis xy; % Inwersja osi Y
    xlabel('Czas [s]');
    ylabel('Częstotliwość [Hz]');
    title('Spektrogram');
    colorbar; % Dodanie kolorowej skali 
    

    X=fft(x);
    X=fftshift(X);
    X=X/N;

    fX=(-1/2:1/N:1/2-1/N)*fs;


%THE END