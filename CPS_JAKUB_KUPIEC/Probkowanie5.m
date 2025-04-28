%Próbkowanie5
clc; clear all; close all;
%Sygnał
dt=0.01;
t=-5:dt:5;
%y1=3-sin(800*pi*t+0.5*pi);
%y2=5*cos(400*pi*t+0.57*pi);
%y=y1+y2;
y=syg(t);
%Próbkowanie
N=50;
n=-25:N/2-1;
fs=5;
ts=n/fs;
x=syg(ts);
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

function y=syg(t)
y1=3-sin(8*pi*t+0.5*pi);
y2=5*cos(4*pi*t+0.57*pi);
y=y1+y2;
end