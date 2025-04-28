%DFTZad3
clc; clear all; close;

%Sygnał
dt=0.001;
t=-11:dt:11; f0=3;
s=1/4+sin(2*pi*f0*t);

%Próbkowanie
fs=10;
N=fs*22;
l=-N/2:N/2-1;
ts=l/fs;
x=1/4+sin(2*pi*f0*ts);

%CFT
f=-11:dt:11;
for n=1:length(f)
    cft(n)=sum(s.*exp(-1j*2*pi*f(n)*t))*dt;
end

%DFT
%n=l;
%k=l;
%DFT=MyDFT(x);
%fz=k*fs/N;


figure(1)
    subplot(2,2,1)
        plot(t,s,'r-'); hold on;grid on;
        title('Analogowy');
    subplot(2,2,2)
        stem(l/fs,x,'go');hold on; grid on;
        title('Dyskretny');
    subplot(2,2,3)
        plot(f,cft,'r-'); hold on;grid on;
        title('CFT');
   % subplot(2,2,4)
   %     stem(fz,DFT,'go');hold on; grid on;
   %     title('DFT');

