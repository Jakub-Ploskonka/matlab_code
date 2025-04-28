%Lab10
clc; clear; close all;
%Parametry
fp=1250;
fr=1750;
Rr=50;%Okno Hamminga
a=3.3;
fs=8000;
f0=(fp+fr)/2;

R=ceil(a*fs/(fr-fp))
K=R+1;
f=0:fs/K:fs-fs/K;

H=zeros(1,K);
for n=1:K
H(n)=xpi(f(n)/(2*f0/fs)).*exp(-1*j*pi*f(n)*R/2);
end

h=ifft(H);
h=h.*hamming(K);

stem(f,abs(h));

