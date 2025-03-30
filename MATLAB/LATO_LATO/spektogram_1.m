% CPS spektrogram
% Jakub P
% lab 6
% zad ?
clc; clear; close all;

load STFT_02.mat; % Zaimportuj funkcję lub skrypt z pliku .p

do = 256; % długosc okna
po = do/2; % przesuniecie okna

nf=2^8; %ilosc probek w fft

% Wygeneruj spektrogram
[s1, f1, t1] = spectrogram(x,do, po,nf,fs);
[s, f, t] = my_spectrogram(x,do,po,nf,fs);


figure(2)
    imagesc(t1, f1, 20*log10(abs(s1)));
    axis xy; % Inwersja osi Y
    xlabel('Czas [s]');
    ylabel('Częstotliwość [Hz]');
    title('Spektrogram matlabowy');
    colorbar; % Dodanie kolorowej skali

    X=fft(x);
    X=fftshift(X);
    X=X/N;

    fX=(-1/2:1/N:1/2-1/N)*fs;

figure(3)
    subplot(2,1,1)
        stem(fX,abs(X),"ro"); grid on; hold on;
    subplot(2,1,2)
        plot(fX,10*log10(abs(X)/(max(abs(X)))),"g.-"); grid on; hold on;


%THE END