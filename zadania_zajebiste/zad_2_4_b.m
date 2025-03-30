clc; clear; close all;

f0=2400;    fs=9000;    N=15;
dt=1/fs;    td=dt*(N-1);
n=0:N-1;
ts=n/fs;

sp=-0.25+sin(2*pi*f0*ts);

Ex=0;
for k=1:N
    Ex=Ex+abs(sp(k))^2;
end

S=fft(sp);

EX=0;
for k=1:N
    EX=EX+(1/N)*(abs(S(k))^2);
end

a=Ex
b=EX

err=a-b

n=0:N-1;
f=fs/N*(0:N-1);

figure(1)
    subplot(2,1,1)
    stem(f, abs(S)); grid on; hold on;

    subplot(2,1,2)
    stem(f, angle(S)); grid on; hold on;