%DFTSymetrie
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
N=22;%Dla N nieparzystego wykres fazy jest nieparzysty
t=0:dt:(N)/fs;
s=-1/4-sin(2*pi*f0*t);

%Próbkowanie
n=0:N-1;
ts=n/fs;
x=-1/4-sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=-N:N-1;
X=MyDFTV1(x,k,n);
f=k*fs/N;
%Xref=fft(x);

figure(1)
    plot(t,s,'b-');hold on; grid on;
    stem(ts,x,'go');

figure(2)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    stem(fs/2,0,'ro');
    title('DFT modul');
subplot(2,1,2)
    stem(f,angle(X)/pi,'bo');grid on;hold on;
    stem(fs/2,0,'ro');
    title('DFT faza');
 
%DFT
n=0:N-1;
k=0:N-1;
X=MyDFT(x);
f=k*fs/N;

figure(3)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    stem(fs/2,0,'ro');
    title('DFT modul');
subplot(2,1,2)
    stem(f,angle(X)/pi,'bo');grid on;hold on;
    stem(fs/2,0,'ro')
    title('DFT faza');

