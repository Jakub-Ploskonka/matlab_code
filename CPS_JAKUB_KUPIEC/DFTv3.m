%DFTv3
clc; close all; clear;
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
f=k*fs/N;

w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
X=A*x(:);

figure(2)
    stem(f,abs(X),'bo');grid on;
  
%IDFT %Jest git
xodtw=A^(-1)*X;
figure(3)
    stem(ts,xodtw,'ro');grid on;
