%DFTv2
clc; close all; clear;
%Tworzenie sygnału
dt=0.001;
t=0:dt:5;
td=1.5; %Opóźnienie
T=3; %Szerokość

s=xtri(t,td,T);

%Probkowanie
fs=4; %f probkowania
N=5*fs;
l=0:N-1;
ts=l*1/fs; %czas dyskretny
x=xtri(ts,td,T);

figure(1)
    plot(t,s,'r-'); hold on;
    stem(l/fs,x,'go');%próbki

%DFT
f=l*fs/N;

S=zeros(1,N);
for k=0:N-1
    for n=0:N-1
        S(k+1)=S(k+1)+s(n+1)*exp(-1j*2*pi*k/N*n);
    end
end

figure(2)
    stem(f,abs(S),'bo'); hold on; grid on;

%IDFT %Nie zgadza się
sodtw=zeros(1,N);
for n=0:N-1
    for k=0:N-1
        sodtw(n+1)=sodtw(n+1)+S(k+1)*exp(1j*2*pi*k/N*n);
    end
end
sodtw=sodtw/N;
figure(3)
    stem(ts,sodtw,'ro');


