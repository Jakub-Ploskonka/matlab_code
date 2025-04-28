%Charakterystyka_f
clc;clear;close all;
x=[3,2,1];
y=[2,3,4];
N=50;

[Href,wref]=freqz(y,x);
[H,w]=charf(y,x,N);
H=H.';
w=w.';


figure(1)
    plot(wref/pi,20*log10(abs(Href)));grid on; hold on;
    stem(w/pi,20*log10(abs(H)),'rx');grid on; hold on;


function [H,w] = charf(y,x,n)
w=linspace(0,pi,n);%n wartości od 0 do pi
H=zeros(1,n);
for i=1:n
z=exp(j*w(i));
Yz=polyval(y,z);
Xz=polyval(x,z);
H(i)=Yz/Xz;
end
end