%
%
%
%
%
clc; clear; close all;

%fir 1 robi wykresy charakterystyki
%do fir 3 i 4 współczynniki metody okna muszą być w h1 a dft w h2 
%fir 3(H1,F1) jest do okien, fir 4(H2,F2) do dft

fp = 1250;
fr = 1750; 
fs = 8000; 
Rr = 40; % ---> okno Von Hann'a

a = 3.1;

R = ceil(a*fs/(fr-fp)); % -> ceil zaokrągla w górę
K = R+1;

f0 = (fp+fr)/2;

%Metoda okien czasowych
n = 0:R;
h1s = 2*f0/fs .*sinc(2*f0/fs*(n-(R/2))); % h1s -> h1 spróbkowane
h1 = h1s.*hanning(K);

fir_1
[H1, F1] = freqz(h1,1,K*20,fs);
fir_3; hold on;

%Metoda DFT
l = 1;
M = 2*K+l;

fm = fs/M; %F przypadajaca na jeden prazek
Hm = zeros(1,M); % [1 1 1 ... 1 0 ... 0 0 1 ... 1 1 ]
for N = 1:M
    if (N-1)*fm<f0
        Hm(N) = 1;
        Hm(M-N+1) = 1;
        last = N;
    end
end
Hm(M-last+1) = 0;

hm = fftshift(ifft(Hm));
hm = hm(ceil(M/4):floor(M*3/4-l));

h2 = hm.*hamming(K)';

df =fs/length(Hm);
f = 0:df:df*(length(Hm)-1);

[H2, F2] = freqz(h2,1,K*20,fs);
fir_4;


figure(5)
    stem(f, Hm, 'LineWidth', 2);

figure(6)
    stem(f, 10*log10(Hm), 'LineWidth', 2);

