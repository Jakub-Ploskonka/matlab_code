%Dualność
clc; clear; close all;
fs=1000;
N=10;
n=0:N-1;
tx=n/fs;
x=sin(2*pi*100*tx);
X=fft(x);
f=0:fs/N:fs-fs/N;

x1=j*sin(2*pi*100*tx);
X1=fft(x1);

figure(1)
subplot(4,1,1)
    stem(f,real(X)/N,'go');grid on;hold on;
subplot(4,1,2)
    stem(f,imag(X)/N,'go');grid on;hold on;
subplot(4,1,3)
    stem(f,real(X1)/N,'go');grid on;hold on;
subplot(4,1,4)
    stem(f,imag(X1)/N,'go');grid on;hold on;

x2=cos(2*pi*100*tx);
X2=fft(x2);

x3=j*cos(2*pi*100*tx);
X3=fft(x3);

figure(2)
subplot(4,1,1)
    stem(f,real(X2)/N,'go');grid on;hold on;
subplot(4,1,2)
    stem(f,imag(X2)/N,'go');grid on;hold on;
subplot(4,1,3)
    stem(f,real(X3)/N,'go');grid on;hold on;
subplot(4,1,4)
    stem(f,imag(X3)/N,'go');grid on;hold on;
