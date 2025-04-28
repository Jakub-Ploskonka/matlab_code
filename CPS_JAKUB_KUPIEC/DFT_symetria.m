%DFT_symetria
clc; close all; clear;
dt=0.00001;
f0=3000;
fs=9000;
N=15;
t=0:dt:(N)/fs;
s=1/4+sin(2*pi*f0*t);

%Próbkowanie
n=0:N-1;
ts=n/fs;
x1=1/4+sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=0:N-1;
X1=MyDFT(x1);
f1=k*fs/N;

k=(-N+1)/2:(N-1)/2;
X2=MyDFT(x1);
f2=k*fs/N;

%N=22
N=22;
t=0:dt:(N)/fs;
s=1/4+sin(2*pi*f0*t);

%Próbkowanie
n=0:N-1;
ts=n/fs;
x2=1/4+sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=0:N-1;
X3=MyDFT(x2);
f3=k*fs/N;

k=(-N+1)/2:(N-1)/2;
X4=MyDFT(x2);
f4=k*fs/N;

figure(1)
subplot(4,1,1)
    stem(f1,angle(X1)/pi,'bo');grid on;hold on;
    stem(f1,abs(X1),'gx');grid on;hold on;
    stem(fs/2,0,'ro');grid on;hold on;
    title('N=15 os fn');
subplot(4,1,2)
    stem(f2,angle(X2)/pi,'bo');grid on;hold on;
    %stem(f2,angle(fftshift(fft(x1)))/pi,'gx');grid on;hold on;
    title('N=15 os 00');
subplot(4,1,3)
    stem(f3,angle(X3)/pi,'bo');grid on;hold on;
    stem(f3,abs(X3),'gx');grid on;hold on;
    stem(fs/2,0,'ro');grid on;hold on;
    title('N=22 os fn');
subplot(4,1,4)
    stem(f4,angle(X4)/pi,'bo');grid on;hold on;
    %stem(f4,angle(fftshift(fft(x4)))/pi,'gx');grid on;hold on;
    title('N=22 os 00');

