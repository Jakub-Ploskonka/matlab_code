%Lab10oknaDFT 
clc; clear; close all;
%Parametry
fp=1250;
fr=1750;
Rr=50;%Okno Hamminga
a=3.3;
fs=8000;
f0=(fp+fr)/2;

R = ceil(a*fs/(fr-fp));
K = R+1;
%Liczba prążków
M = 4*K;
L = (M-2)/2;

Df = fs/M;
f = 0:Df:M*Df-Df;

o = floor(f0/Df);
HM = [1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
%HM = [1,ones(1,(L-1)/2),zeros(1,M-L),ones(1,(L-1)/2)];
hx = fftshift(ifft(HM));
%Korelacja pod okno
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2));
h = hx(:).*hamming(K);

n = 0:R;

figure(1);
subplot(2,1,1);
stem(f,HM,"b.");
xlim([0,fs/2]);
grid on; hold on;
title('H');
subplot(2,1,2);
grid on; hold on;
title('h');
stem(n,h,"r.");

%Charakterystyka częstotliwościowa
[H1 F1] = freqz(h,1,K*200,fs);
figure(2);
subplot(2,1,1)
stem(F1,abs(H1),"g.");hold on; xlim([0,fs/2]);
grid on; hold on;
title('|H(f)|');
subplot(2,1,2)
stem(F1,angle(H1)/pi,"g.");hold on; xlim([0,fs/2]);
grid on; hold on;
title('Faza H(f)');

sygnal = 1;
switch(sygnal)
    case 1
        fs=8000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
end

y = conv(h,xs);

figure(3);
subplot(3,1,1);
stem(xs,"r.");hold on; title("x");grid on; hold on;
subplot(3,1,2);
stem(h,"b.");title("h");grid on; hold on;
subplot(3,1,3);
stem(y,"g.");title("y");grid on; hold on;

%Df = fs/K;
%f = 0:Df:Df*K-Df;
M=800;
Df = fs/M;
f = 0:Df:Df*M-Df;

H = fft(h,M);
X = fft(xs,M);
Y = X(:).*H;

figure(4);
subplot(3,1,1);
stem(f,abs(X),"r.");hold on; xlim([0,fs/2]);title("X");grid on; hold on;
subplot(3,1,2);
stem(f,abs(H),"b.");xlim([0,fs/2]);title("H");grid on; hold on;
subplot(3,1,3);
stem(f,abs(Y),"g.");xlim([0,fs/2]);title("Y");grid on; hold on;