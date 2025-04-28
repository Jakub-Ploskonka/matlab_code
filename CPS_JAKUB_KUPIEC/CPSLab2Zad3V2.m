%CPSLab2Zad3V2
%CPSLab2Zad3
%Probkowanie i odtwarzanie
clc; close all; clear;
f0=1; k=2; t=-5:0.001:5;
fs=2;

%Funkcja
y=xpi(t,0,4);
%Próbkowanie
N=10*fs;
n=-N/2:N/2-1;
ts=n/fs;
x=xpi(ts,0,4);
%Odtwarzanie
odtw=zeros(1,length(t));
for i=1:N
odtw=odtw+x(i).*sin(pi*fs*(t-n(i).*(1/fs)))./(pi*fs*(t-n(i).*(1/fs)));
end

%Transformata
f=-5:0.001:5;
S=zeros(1,length(f));
for i=1:N
    S=S+x(i)./fs.*xpi(f,0,fs,0.001).*exp(-1*j*2*pi*f*n(i)/fs);
end

figure(1)
    plot(t,y,'b-'); hold on;
    plot(t,odtw,'g-'); hold on;
    stem(n/fs,x,'ro'); grid on;
figure(2)
    plot(f,S,'g-'); hold on; grid on;