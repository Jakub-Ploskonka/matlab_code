%DFTZad2
clc; clear all; close;
%Tworzenie sygnału
dt=0.001;
t=0:dt:5;
td=1; %Opóźnienie
T=2; %Szerokość

s=xpi(t,td,T);

%Probkowanie
fs=4; %f probkowania
N=5*fs;
l=0:N-1;
ts=l*1/fs; %czas dyskretny
x=xpi(ts,td,T);

figure(1)
    plot(t,s,'r-'); hold on;grid on;
    stem(l/fs,x,'go');%próbki

%DFT
n=0:N-1;
k=0:N-1;
X=MyDFT(x);
f=k*fs/N;
Xref=fft(x);

figure(2)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    stem(f,abs(Xref),'ro')
subplot(2,1,2)
    stem(f,angle(X)/pi,'bo');grid on;hold on;
    stem(f,angle(Xref)/pi,'ro')

%IDFT
xodtw=MyIDFT(X);
xodtwref=ifft(Xref);

figure(3)
subplot(2,1,1)
    stem(f,abs(xodtw),'bo');grid on;hold on;
    stem(f,abs(xodtwref),'ro')
subplot(2,1,2)
    stem(f,angle(xodtw)/pi,'bo');grid on;hold on;
    stem(f,angle(xodtwref)/pi,'ro')