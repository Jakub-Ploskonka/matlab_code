%Fir_dolnopasmowy_DFT
clc; clear; close all;
fp=1200;
fr=1500;
Rr=63;%Okno Hamminga
a=5.5;
fs=8000;
f0=(fp+fr)/2;
R=ceil(a*fs/(fr-fp));
K=R+1;

M = 4*K;
L = (M-2)/2;

Df = fs/M;
f = 0:Df:M*Df-Df;
o = floor(f0/Df);
HM = [1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
%Środek
hx = fftshift(ifft(HM));
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2));
h = hx(:).*blackman(K);

figure(1);
    stem(h,"b."); xlim([0,R]);
    grid on; hold on;
    title('h');

%odp impulsowa
[H1, F1] = freqz(h,1,K*200,fs);

figure(2)
subplot(2,1,1)
    plot(F1,abs(H1));grid on; hold on;
subplot(2,1,2)
    plot(F1,20*log10(abs(H1)));grid on; hold on;

Dt=1/fs;
t = 0:Dt:K*Dt-Dt;
x=sin(2*pi*t*1000)+sin(2*pi*t*3000)+sin(2*pi*t*1500);
M=1000;%Minimalizacja przecieku
Df = fs/M;
f = 0:Df:Df*M-Df;
X = fft(x,M);
H = fft(h,M);
Y = X(:).*H;

figure(4);
subplot(3,1,1);
stem(f,abs(X),"r.");hold on; xlim([0,fs/2]);title("X");
grid on; hold on;
subplot(3,1,2);
stem(f,abs(H),"b.");xlim([0,fs/2]);title("H");
grid on; hold on;
subplot(3,1,3);
stem(f,abs(Y),"g.");xlim([0,fs/2]);title("Y");
grid on; hold on;