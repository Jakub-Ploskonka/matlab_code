% Autor Jakub Ploskonka
% 09 06 2025
% metoda okien czasowych - przyklad z wykladu

clc; clear; close all;

fp = 10; 
fr = 15; 
Rr = 40; 
fs = 50;
f0 = (fp+fr)/2;

%ponieważ Rr = 40db wybieramy okno z najbliższym większym tłumieniem czyli
%okno von Hanna (Rr = 44) dla którego
a = 3.1; %.
R = ceil(a*fs/(fr-fp)); %R musi być większą bądź równą liczbą całkowitą dlatego zaokrąglamy w górę
R
K = R+1;

df = 100; 
f =-2:df:fs/2;
f_h1s = 0:(fs/R):fs;



%Metoda okien czasowych
n = 0:R;
h1s = 2*f0/fs .* sinc(2*f0/fs * (n-(R/2)));
h1o = h1s .* hann(K)';
H1s = fftshift(fft(h1o));

[H2 F2] = freqz(h1o,1,50,fs);

figure(1)
stem(f_h1s,h1s);

figure(1)
freqz(h1o,1,2^12,fs)
xline(fp);
xline(fr);
fir_1;




%Funkcja wbudowana
b = fir1(R,f0/(fs/2),hann(K));

figure(10)
freqz(b,1,2^12,fs)
xline(fp)
xline(fr)