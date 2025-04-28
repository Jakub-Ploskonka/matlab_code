%Aliasing w dft
clc; clear; close all;
dt=0.00001;
f0=400;
f1=700;
fs=1000;
N=100;
t=0:dt:(N)/fs;
s=sin(2*pi*f0*t)+sin(2*pi*f1*t);

n=0:N-1;
ts=n/fs;
x=sin(2*pi*f0*ts)+sin(2*pi*f1*ts);
f=n*fs/N;

X=fft(x);
figure(1)
    plot(f,abs(X),'b-');hold on; grid on;