%Pasmowo_przepustowy_DFT
clc; clear;close all;
fx=1500;%środek pasma
fs=10000;
Bp=250;
B=1000;
Rr=63;
a=5.5;
R=ceil(a*fs/Bp);
K=R+1;
fp=B-Bp/2;
fr=B+Bp/2;
f0=(fp+fr)/2;

M=4*K;
L=(M-2)/2;
Df = fs/M;
f = 0:Df:M*Df-Df;
o = floor(f0/Df);
HM=[1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
hx = fftshift(ifft(HM));
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2)+1);
h = hx(:).*blackman(K);

%odp impulsowa
[H1, F1] = freqz(h,1,K*200,fs);

figure(1)
subplot(2,1,1)
    plot(F1,abs(H1));grid on; hold on;
subplot(2,1,2)
    plot(F1,20*log10(abs(H1)));grid on; hold on;

n = 0:R;
Df = fs/K;
f = 0:Df:Df*K-Df;
hPP = 2*cos(2*pi*fx/fs.*(n-R/2-1/2)).*(h.');
HPP = fft(hPP);


figure(2)
subplot(2,1,1)
    plot(f,abs(HPP));grid on; hold on;
    xlim([0,fs/2])
subplot(2,1,2)
    plot(f,20*log10(abs(HPP)));grid on; hold on;
    xlim([0,fs/2])