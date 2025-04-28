%DFT_kontynuacja
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
N=22;%21/22 %Do weryfikacji symetrii
t=0:dt:(N)/fs;
%t=(-N)/fs:dt:(N)/fs;
s=-1/4-sin(2*pi*f0*t);

%Próbkowanie
n=0:N-1;
%n=-N:N-1;
ts=n/fs;
x=-1/4-sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
%n=-N:N-1;
%k=-N:N-1;
k=0:N-1;
X=MyDFT(x);
%X=MyDFTV1(x,k,n);
f=k*fs/N;
Xref=fft(x);

%IDFT
xodtw=MyIDFT(X);
%xodtw=MyIDFTV1(x,k,n);
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
figure(3)
subplot(2,1,1)
    stem(ts,abs(xodtw),'bo');grid on;hold on;
    stem(ts,abs(xodtwref),'rx')
    title('IDFT modul');
subplot(2,1,2)
    stem(ts,angle(xodtw)/pi,'bo');grid on;hold on;
    stem(ts,angle(xodtwref)/pi,'rx')
    title('IDFT faza');