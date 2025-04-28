%DFT_Wl_Przekszt
clc; close all; clear;
dt=0.00001;
f0=[2500,5000];
fs=12000;
N=21;
t=0:dt:(N)/fs;
for l=1:2
    close all;
s=-1/4-sin(2*pi*f0(l)*t);

%Próbkowanie
n=0:N-1;
ts=n/fs;
x=-1/4-sin(2*pi*f0(l)*ts);
   
%DFT
n=0:N-1;
k=0:N-1;
X=MyDFT(x);
f=k*fs/N;
Xref=fft(x);

figure(1)
    plot(t,s,'b-');hold on; grid on;
    stem(ts,x,'go');

figure(2)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    stem(f,abs(Xref),'rx')
    title('DFT modul');
subplot(2,1,2)
    stem(f,angle(X)/pi,'bo');grid on;hold on;
    stem(f,angle(Xref)/pi,'rx')
    title('DFT faza');

    pause;
end