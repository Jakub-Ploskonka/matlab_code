clc; clear; close all;
% Filtry FIR
% Zadanie 1
% Parametry filtru
fp = 1250; % Częstotliwość końca pasma przepustowego (Hz)
fr = 1750; % Częstotliwość początku pasma zaporowego (Hz)
Rr = 40;   % Minimalne wymagane tłumienie w paśmie zaporowym (dB)
fs = 8000; % Częstotliwość próbkowania (Hz)
Q=1000;

f0=(fp+fr)/2;

% parametry dla okna Hamminga
alfa=3.3;
R=ceil(alfa*(fs/(fr-fp))); % ceil zaokrągla elementy do góry
R
K=R+1;

n=0:K-1;
hx = 2*(f0/fs)*sinc(2*(f0/fs)*(n-R/2));

h=hx.*hamming(K)';


H1=fft(h,Q);
F1=[0:Q-1] * fs / Q;
h1=ifft(H1);

figure(1)
subplot(3,1,1)
stem(n,h); grid on;
subplot(2,1,2)
plot(F1, abs(H1),'magenta', LineWidth=2); grid on;

figure(2)
subplot(3,1,1)
stem(n,h); grid on;
subplot(3,1,2)
plot(F1, abs(H1), 'magenta', LineWidth=2); grid on;
subplot(3,1,3);
plot(F1, 20*log10(abs(H1)),'magenta', LineWidth=2); grid on;




 figure(3)
 subplot(3,1,1)
 stem(n,h); grid on;
 subplot(2,1,2)
 plot(F1, abs(H1)); grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zadanie 2
fx1=[650,1200,1800,3125];
fs1=8000;
fx2=[650,1300,1700,3125];
fs2=16000;
fx3=[650,1300,1700];
fs3=4000;

t=0:1/fs1:1-1/fs1;

x1=sin(2*pi*t*650)+sin(2*pi*t*1300)+sin(2*pi*t*1700)+sin(2*pi*t*3125);
y1=conv(x1, h, 'same');

X1=fft(x1);
Y1=fft(y1);
f=(0:length(X1)-1)*fs/length(X1);


 % figure(5)
 % subplot(2,1,1)
 % plot(f,abs(X1)/fs1); grid on; hold on;
 % plot(F1,abs(H1)); hold on;
 % plot(f,abs(Y1)/fs1,'g');
 % subplot(2,1,2)
 % plot(f,angle(X1)); grid on; hold on;
 % plot(F1,angle(H1),'magenta'); hold on;
 % plot(f,angle(Y1), 'b');

fir_1
