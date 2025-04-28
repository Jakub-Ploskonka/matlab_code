%Zad1
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
x=1/4+sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=0:N-1;
X=MyDFT(x);
f=k*fs/N;
Xref=fft(x);

%IDFT
xodtw=MyIDFT(X)
xodtwref=ifft(Xref);

figure(1)
    plot(t,s,'b-');hold on; grid on;
    stem(ts,x,'go');
    stem(ts,real(xodtw),'rx')

figure(2)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    stem(f,abs(Xref),'rx')
    title('DFT modul');
subplot(2,1,2)
    stem(f,angle(X)/pi,'bo');grid on;hold on;
    stem(f,angle(Xref)/pi,'rx')
    title('DFT faza');
%figure(3)
%    subplot(2,1,1)
%    stem(ts,abs(xodtw),'bo');grid on;hold on;
%    stem(ts,abs(xodtwref),'ro')
%    title('IDFT modul');
%subplot(2,1,2)
%    stem(ts,angle(xodtw)/pi,'bo');grid on;hold on;
%    stem(ts,angle(xodtwref)/pi,'ro')
%    title('IDFT faza');