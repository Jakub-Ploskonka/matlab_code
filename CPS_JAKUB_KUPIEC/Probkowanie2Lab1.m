%Probkowanie i oddtwarzanie
clc; close all; clear all;
f0=1; k=2; t=-10:0.01:10;
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

figure(1)
plot(t,y,'b-'); hold on;
figure(2)
plot(t,odtw,'g-'); hold on;