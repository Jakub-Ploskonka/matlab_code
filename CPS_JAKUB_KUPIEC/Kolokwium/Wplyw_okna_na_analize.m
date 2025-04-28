%Wpływ_okna_na_analize
clc;clear;close all;

fs=1000;
N=30;
n=0:N-1;
tx=n/fs;
M=440;
f=0:fs/M:fs-fs/M;
x=2*sin(2*pi*100*tx-pi/3)-3*cos(2*pi*110*tx+pi/4)+cos(2*pi*200*tx);
X=fft(x,M);

ratio1 = sum(rectwin(N))/sum(hanning(N).');
xs1 = x.*hanning(N).'*ratio1;
XS1 = fft(xs1,M);
ratio2 = sum(rectwin(N))/sum(flattopwin(N).');
xs2 = x.*flattopwin(N).'*ratio2;
XS2 = fft(xs2,M);


figure(1)
    subplot(3,1,1)
       stem(f,abs(X)); 
    subplot(3,1,2)
       stem(f,abs(XS1));
    subplot(3,1,3)
       stem(f,abs(XS2));

