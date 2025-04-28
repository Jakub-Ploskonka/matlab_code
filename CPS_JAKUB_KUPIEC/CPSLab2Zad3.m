%CPSLab2Zad3
%Probkowanie i odtwarzanie
clc; close all; clear;
f0=1; k=2; t=-10:0.001:10;
fs=5;

%Funkcja
y=CPS_lab1(t,f0,k);
%Próbkowanie
N=100;
n=-50:N-51;
ts=n/fs;
x=CPS_lab1(ts,f0,k);
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