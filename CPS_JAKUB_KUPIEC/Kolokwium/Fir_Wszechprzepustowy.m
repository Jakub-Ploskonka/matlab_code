%Fir_wszechprzepustowy
clc; clear; close all;
R=16;
%R=15;
n=0:R;
fs=10;

hn=sinc(n-R/2);

figure(1)
    stem(n,hn);grid on; hold on;

M=1024;
f=(0:M-1)*fs/M;
H=fft(hn,M);

figure(2)
    subplot(2,1,1)
        plot(f,abs(H));grid on;hold on;
    subplot(2,1,2)
        plot(f,20*log10(abs(H)));grid on;hold on;


