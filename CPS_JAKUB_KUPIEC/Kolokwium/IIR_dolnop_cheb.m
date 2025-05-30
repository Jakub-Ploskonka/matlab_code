%IIR_dolnop_cheb
clc;clear;close all;
Rp=2;
Rr=40;
fp=1000;
fr=1300;
fs=5000;
N = ceil(acosh(sqrt(10^(Rr/10)-1)/(sqrt(10^(Rp/10)-1)))/acosh(fr/fp));%Rząd filtru
fi = (fp+fr)/2;
Ri = (Rp+Rr)/2;
e=sqrt(10^(Rp/10)-1);
f0 = fi*cosh(1/N*acosh(1/e));%Częstotliwość graniczna
za=[];
k=1:N;
pa=2*pi*f0*exp(j*pi*(1/2+(2*k-1)/(2*N)));
ka = abs(prod(pa));

[ba, aa] = zp2tf(za,pa,ka);%Współczynniki filtru analogowego
[r,p,K] = residue(ba,aa);%Rozkład na ułamki proste

Ts = 1/fs;
licznik = Ts*r;
mianownik = exp(Ts*p);
[b1,a1] = residue(licznik,mianownik,K);

[H1, F1] = freqz(b1,a1,1000,fs);
figure(1)
plot(F1,abs(H1));grid on; hold on;
hold on; grid on;
