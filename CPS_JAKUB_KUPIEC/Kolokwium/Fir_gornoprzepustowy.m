%Fir_gornoprzepustowy
clc; clear; close all;
R=40;
K=R+1;
h=fir1(R,1/20,hamming(R+1));

[H1, F1] = freqz(h,1,K*200);
figure(1)
subplot(2,1,1)
    plot(F1,abs(H1));grid on; hold on;
subplot(2,1,2)
    plot(F1,20*log10(abs(H1)));grid on; hold on;

n=0:R;
hGP=h.*cos(pi*(n-R/2));
[HGP, F2] = freqz(hGP,1,K*200);
figure(2)
subplot(2,1,1)
    plot(F2,abs(HGP));grid on; hold on;
subplot(2,1,2)
    plot(F2,20*log10(abs(HGP)));grid on; hold on;