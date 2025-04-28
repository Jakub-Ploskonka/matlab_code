%Probkowanie4
clc; clear all; close all;
%Sygnał
dt=0.01;
t=-5:dt:5;
td=0; T=2;
y=xpi(t,td,T);

%Probkowanie
fs=5;
N=100;
n=-50:N/2-1;
ts=n/fs;
x=xpi(ts,td,T);

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