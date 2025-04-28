%Aliasing2
clc; clear; close all;
%Sygnał
dt=0.01; t=-5:dt:5; f0=11; f1=3;
y=sin(2*pi*f0*t)+sin(2*pi*f1*t);
%Próbkowanie
fs=5; T=1/fs;
N=50;
n=-25:N/2-1;
ts=n/fs;
x=sin(2*pi*f0*ts);
%Odtwarzanie
odtw=zeros(1,length(t));
for i=1:N
    odtw=odtw+x(i)*sin(pi*fs*(t-n(i)/fs))./(pi*fs*(t-n(i)/fs));
end

figure(1)
    plot(t,y,'b-');grid on; hold on;
    stem(n/fs,x,'go');%próbki
figure(2)
    plot(t,odtw,'g-'); grid on; hold on;