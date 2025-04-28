clc; clear; close all;

fp = 1250; fr = 1750; Rr = 50; fs = 8000;
%ponieważ Rr = 50db wybieramy okno z najbliższym większym tłumieniem czyli
%okno Hamminga (Rr = 53) dla którego
a = 3.3; %.
R = ceil(a*fs/(fr-fp)); %R musi być większą bądź równą liczbą całkowitą dlatego zaokrąglamy w górę
K = R+1;

df = 100; f =-2:df:fs/2;

f0 = (fp+fr)/2;






%Metoda okien czasowych
n = 0:R;
h1s = 2*f0/fs .*sinc(2*f0/fs*(n-(R/2)));
h1o = h1s.*hanning(K)';
H1s = fftshift(fft(h1o));

figure(2)
freqz(h1o,1,2^12,fs)
xline(fp)
xline(fr)






%Funkcja wbudowana
b = fir1(R,f0/(fs/2),hanning(K));

figure(10)
freqz(b,1,2^12,fs)
xline(fp)
xline(fr)