%DFT
clc; close all; clear;
fs=1000;
N=10;
n=0:N-1;
tx=n/fs;
x=sin(2*pi*100*tx)+sin(2*pi*200*tx);
X=dft(x);
Xref=fft(x);
f=0:fs/N:fs-fs/N;

%Liniowość
a=2;
x1=a*(sin(2*pi*100*tx)+sin(2*pi*200*tx));
X1=dft(x1);

%Przesunięcie
n0=50;
n1=n-n0;
tx1=n1/fs;
x2=sin(2*pi*100*tx1)+sin(2*pi*200*tx1);
X2=dft(x2);



figure(1)
subplot(3,1,1)
    stem(f,abs(X)/N,'go');grid on;hold on;
    stem(f,abs(Xref)/N,'rx');
    title('|DFT|');
subplot(3,1,2)
    stem(f,abs(X1)/N,'go');grid on;hold on;
    stem(f,a*abs(X)/N,'rx');
    title('Liniowość');
subplot(3,1,3)
    stem(f,abs(X2)/N,'go');grid on;hold on;
    stem(f,abs(X*exp(-j*2*pi*n*n0/N))/N,'rx');
    title('Przesunięcie');

function X = dft(x)
n=0:length(x)-1;
k=n;
A=exp(-j*2*pi*k(:)*n/length(x));
X=A*x(:);
end