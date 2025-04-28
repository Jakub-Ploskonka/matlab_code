%Charakterystykaf_z_zerami_biegunami
%Obliczanie wsp wielomianu na podstawie miejsc zerowych - poly
clc;clear;close all;
z=[3,2,1];
p=[2,3,4];
k=1;
N=50;

y=poly(z)*k;
x=poly(p);
[Href,wref]=freqz(y,x);
[H,w]=Charf(z,p,k,N);
H=H.';
w=w.';

figure(1)
    plot(wref/pi,20*log10(abs(Href)));grid on; hold on;
    stem(w/pi,20*log10(abs(H)),'rx');grid on; hold on;


function [H,w] = Charf(z,p,k,n)
y=poly(z);
x=poly(p);
w=linspace(0,pi,n);
H=zeros(1,n);
for i=1:n
z=exp(j*w(i));
X=polyval(x,z);
Y=polyval(y,z);
H(i)=k*Y/X;
end
end