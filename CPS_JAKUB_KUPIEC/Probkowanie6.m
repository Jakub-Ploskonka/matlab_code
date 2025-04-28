%Próbkowanie6
clc; clear all; close all;
%Sygnał
dt=0.01;
t=-5:dt:5;
f0=3;
y=syg(t,f0);
%Próbkowanie
N=50;
n=-25:N/2-1;
fs=5;
ts=n/fs;
x=syg(ts,f0);
%Odtwarzanie
odtw=zeros(1,length(t));
for i=1:N
    odtw=odtw+x(i)*sin(pi*fs*(t-n(i)/fs))./(pi*fs*(t-n(i)/fs));
end

figure(1)
    plot(t,y,'b-'); hold on;
    stem(n/fs,x,'go');%próbki
figure(2)
    plot(t,odtw,'g-'); hold on;



function y=syg(t,f0)
y=sin(2*pi*f0*t);
end