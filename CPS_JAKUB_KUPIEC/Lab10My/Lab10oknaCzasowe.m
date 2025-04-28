%Lab10oknaCzasowe
clc; clear; close all;
%Parametry
fp=1250;
fr=1750;
Rr=50;%Okno Hamminga
a=3.3;
fs=8000;
f0=(fp+fr)/2;

R=ceil(a*fs/(fr-fp))
K=R+1;
f=-fs/2:10:fs/2;
tx = 0:1:R;

H = xpi(f/(2*f0/fs)).*exp(-j*2*pi*f*R/2);
hx = 2*f0/fs*sinc(2*f0/fs*(tx-R/2));

h = hx(:).*hamming(K);

figure(1);
    stem(tx,h,"b."); xlim([0,R]);
    grid on; hold on;
    title('h');

%odp impulsowa
Df = fs/K;
F = 0:Df:Df*K-Df;
H = fft(h);
[H1, F1] = freqz(h,1,K*200,fs);

figure(2);
subplot(2,1,1)
%stem(F1,20*log10(abs(H1)),"g.");hold on; xlim([0,fs/2]);
stem(F1,abs(H1),"g.");hold on; xlim([0,fs/2]);
stem(F,abs(H),"r.");
grid on; hold on;
title('|H(f)|');
subplot(2,1,2)
stem(F1,angle(H1)/pi,"g.");hold on; xlim([0,fs/2]);
stem(F,angle(H)/pi,"r.");
grid on; hold on;
title('Faza H(f)');

%Sprawdzanie filtru
opcja = 1;
switch(opcja)
    case 1
        fs=8000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
    case 4
        fs=4000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
end

y = conv(xs,h);
tx2 = 0:Dt:(length(y))*Dt-Dt;
r=0:R;

figure(3);
subplot(3,1,1);
%stem(tx,xs,"r.");hold on;grid on; title("x");
stem(r,xs,"r.");hold on;grid on; title("x");
subplot(3,1,2);
%stem(tx,h,"b.");title("h"); grid on;
stem(r,h,"b.");title("h"); grid on;
subplot(3,1,3);
%stem(tx2,y,"g.");title("y");grid on;
stem(0:length(y)-1,y,"g.");title("y");grid on;

%Df = fs/K;
%f = 0:Df:Df*K-Df;

M=800;%Minimalizacja przecieku
Df = fs/M;
f = 0:Df:Df*M-Df;
X = fft(xs,M);
H = fft(h,M);
%X = fft(xs);
%H = fft(h);
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
