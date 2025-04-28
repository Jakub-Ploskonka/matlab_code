%Aliasing
clc; clear close all;
N=20;
fs=2000;
n=0:N-1;
tx=n/fs;
x=sin(2*pi*600*tx)+sin(2*pi*800*tx);
X=fft(x);
f=0:fs/N:fs-fs/N;
%Aliasing
fs1=1000;
tx1=n/fs1;
x1=sin(2*pi*600*tx1)+sin(2*pi*800*tx1);
X1=fft(x1);
f1=0:fs1/N:fs1-fs1/N;

figure(1)
    subplot(2,1,1)
        stem(f,abs(X)/N);grid on; hold on;
        title('Bez aliasingu');
    subplot(2,1,2)
        stem(f1,abs(X1)/N);grid on; hold on;
        title('Aliasing');