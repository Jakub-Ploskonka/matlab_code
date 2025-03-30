clc; clear; close all;

f0=2400;    fs=9000;    N=15;
dt=1/fs;    td=dt*(N-1);
t=linspace(0,N/fs,10000);
n=0:N-1;
ts=n/fs;

s=-0.25+sin(2*pi*f0*t);
sp=-0.25+sin(2*pi*f0*ts);

%DFT
X=fft(sp);

Xshift=fftshift(X);

n=length(Xshift);
f=fs/N*(0:N-1);

fshift=(-n/2:n/2-1)*(fs/N) + 300;

figure(1)
    subplot(5,1,1)
    plot(t,s); grid on; hold on;
    stem(ts, sp);

    subplot(5,1,2)
    stem(f, abs(X)); grid on; hold on;

    subplot(5,1,3)
    stem(f, angle(X)); grid on; hold on;

    subplot(5,1,4)
    stem(fshift, abs(Xshift)); grid on; hold on;

    subplot(5,1,5)
    stem(fshift, angle(Xshift)); grid on; hold on;

N=30;
dt=1/fs;    td=dt*(N-1);
t=linspace(0,N/fs,10000);
n=0:N-1;
ts=n/fs;

s=-0.25+sin(2*pi*f0*t);
sp=-0.25+sin(2*pi*f0*ts);

%DFT
X=fft(sp);

Xshift=fftshift(X);

n=length(Xshift);
f=fs/N*(0:N-1);

fshift=(-n/2:n/2-1)*(fs/N);

figure(2)
    subplot(5,1,1)
    plot(t,s); grid on; hold on;
    stem(ts, sp);

    subplot(5,1,2)
    stem(f, abs(X)); grid on; hold on;

    subplot(5,1,3)
    stem(f, angle(X)); grid on; hold on;

    subplot(5,1,4)
    stem(fshift, abs(Xshift)); grid on; hold on;

    subplot(5,1,5)
    stem(fshift, angle(Xshift)); grid on; hold on;