%Lab11
clc; clear; close all;
%fdp butterworth
fp=1250;%koniec pasma prepustowego
fr=1750;%początek pasma zaporowego
fs=8000;
Rr=50;%minimalne tłumienie w paśmie zaporowym
Rp=2;%max amplituda w przepustowym

N = ceil(log10(sqrt(10^(Rr/10)-1)/(sqrt(10^(Rp/10)-1)))/log10(fr/fp));%Rząd filtru

fi = (fp+fr)/2;
Ri = (Rp+Rr)/2;

f0 = fi/(10^(Ri/10)-1)^(1/(2*N));%Częstotliwość graniczna

%Prototyp analogowy
k = 1:N;

za = [];
pa = 2*pi*f0*exp(j*pi*(1/2+(2*k-1)/(2*N)));
ka = abs(prod(pa));

[ba, aa] = zp2tf(za,pa,ka);%Współczynniki filtru analogowego
iir_1;
%[Ha, Fa] = freqs(ba, aa, 2*pi*linspace(0,fs,5e+3));%Charakterystyka częstotliwościowa filtru analogowego
[Ha, Fa] = freqs(ba, aa, 2*pi*linspace(0,fs,4000));
iir_2;

Ts = 1/fs;

[r,p,K] = residue(ba,aa);%Rozkład na ułamki proste
%Odp impulsowa
licznik = Ts*r;
mianownik = exp(Ts*p);
[b1,a1] = residue(licznik,mianownik,K);
Q = 4096;

[H1, F1] = freqz(b1,a1,Q,fs);%Charakterystyka częstotliwościowa filtru cyfrowego
iir_3;

%Odp impulsowa
%[ha,wa,ta]=impulse(ba,aa,linspace(0,10e-3,1000));
%figure(4), hold on; grid on; plot(ta,ha,'b,'linewidth',3);
[h1,t1]=impz(b1,a1,floor(10e-3*fs),fs);
figure(4), hold on; grid on; stem(t1,h1*fs,'gd','fill','linewidth',3);

figure(5);
zplane(ba,aa);
figure(6);
zplane(b1,a1);


%Sprawdzenie fitru
K = length(h1);
mode=1;
switch(mode)
    case 1
    fs=8000; Dt = 1/fs;
    tx = 0:Dt:K*Dt-Dt;
    xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
    fs=16000; Dt = 1/fs;
    tx = 0:Dt:K*Dt-Dt;
    xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
    fs=4000; Dt = 1/fs;
    tx = 0:Dt:K*Dt-Dt;
    xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
end
y = conv(xs,h1);

figure(7);
subplot(3,1,1);
stem(xs,"r");title("x");grid on;
subplot(3,1,2);
stem(h1,"b");title("h");grid on;
subplot(3,1,3);
stem(y,"g");title("y");grid on;

Df = fs/K;
f = 0:Df:Df*K-Df;

%Rozszerzenie M
H = fft(h1);
X = fft(xs);
X=transpose(X);
Y = X.*H;

figure(8);
subplot(3,1,1); 
stem(f,abs(X),"r");xlim([0,fs/2]); title("X");grid on;
subplot(3,1,2);
stem(f,abs(H),"b");xlim([0,fs/2]);title("H");grid on;
subplot(3,1,3);
stem(f,abs(Y),"g");xlim([0,fs/2]);title("Y");grid on;



