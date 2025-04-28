%IIR_biliniowa
clc; clear; close all;
Rp=2;
Rr=40;
fp=1000;
fr=1300;
fs=5000;
%Korekta f
fp_a=fs/pi*tan(fp*pi/fs);
fr_a=fs/pi*tan(fr*pi/fs);

N=ceil(log10(sqrt(10^(0.1*Rr)-1)/sqrt(10^(0.1*Rp)-1))/log10(fr_a/fp_a));
fi = (fp_a+fr_a)/2;
Ri = (Rp+Rr)/2;
f0 = fi/(10^(Ri/10)-1)^(1/(2*N));
%Prototyp
z_a=[];
k=1:N;
p_a=2*pi*f0*exp(j*pi*(1/2+(2*k-1)/(2*N)));
k_a=abs(prod(p_a));
%Transformacja
Ts=1/fs;
p_d=(1+p_a*(Ts/2))./(1-p_a*(Ts/2));
p_d=p_d(:);
z_d=(-1)*ones(1,N); 
z_d=z_d(:);
k_d=k_a*(prod(2*fs-z_a)/prod(2*fs-p_a));
[b1, a1] = zp2tf(z_d,p_d,k_d);%Współczynniki filtru cyfrowego
[H1, F1] = freqz(b1,a1,1000,fs);
figure(1)
plot(F1,abs(H1));grid on; hold on;
hold on; grid on;
