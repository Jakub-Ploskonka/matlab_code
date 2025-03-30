clc; clear; close all;

f0=2400;    fs=9000;    N=15;
dt=1/fs;    td=dt*(N-1);
t=linspace(0,N/fs,10000);
n=0:N-1;
ts=n/fs;

s1=-0.25+sin(2*pi*f0*t);
s2=0.25-cos(2*pi*f0*t);
sp1=-0.25+sin(2*pi*f0*ts);
sp2=0.25-cos(2*pi*f0*ts);

a=7;
b=3;

asp=a*sp1;
bsp=b*sp2;

s=a*s1+b*s2;
sp=asp+bsp;

S=zeros(1,N);
AS=zeros(1,N);
BS=zeros(1,N);
for k=0:(N-1)
    for n=0:(N-1)
        S(k+1)=S(k+1)+sp(n+1).*exp(-1j*2*pi*n*k/N);
        AS(k+1)=AS(k+1)+asp(n+1).*exp(-1j*2*pi*n*k/N);
        BS(k+1)=BS(k+1)+bsp(n+1).*exp(-1j*2*pi*n*k/N);
    end
end

S2=AS+BS;

n=0:N-1;
f=fs/N*(0:N-1);

figure(1)
    subplot(3,1,1)
    plot(t,s); grid on; hold on;
    stem(ts, sp);

    subplot(3,1,2)
    stem(f, abs(S)); grid on; hold on;
    stem(f, abs(S2), 'r.');

    subplot(3,1,3)
    stem(f, angle(S)); grid on; hold on;
    stem(f, angle(S2), 'r.');