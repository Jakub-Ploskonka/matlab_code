%IDFT
clc;clear; close all;
fs=1000;
N=10;
n=0:N-1;
tx=n/fs;
x=sin(2*pi*100*tx)+sin(2*pi*200*tx);
X=fft(x);
f=0:fs/N:fs-fs/N;
xref=idft(X);

figure(1)
   stem(tx,x,'go');grid on; hold on;
   stem(tx,xref,'rx');



function x = idft(X)
n=0:length(X)-1;
k=n;
A=exp(-j*2*pi*k(:)*n/length(X));
A=A^(-1);
x=A*X(:)
end