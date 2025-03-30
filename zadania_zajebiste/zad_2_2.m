clc; clear; close all;

f0=2400;    fs=9000;    N=15;
dt=1/fs;    td=dt*(N-1);
t=linspace(0,N/fs,10000);
n=0:N-1;
ts=n/fs;

s=-0.25+sin(2*pi*f0*t);
sp=-0.25+sin(2*pi*f0*ts);

%DFT
X=zeros(1,N);
for k=0:(N-1)
    for n=0:(N-1)
        X(k+1)=X(k+1)+sp(n+1).*exp(-1j*2*pi*n*k/N);
    end
end

Xfft=fft(sp);

%IDFT
Xinv=zeros(1,N);
for k=0:(N-1)
    for n=0:(N-1)
        Xinv(k+1)=Xinv(k+1)+X(n+1).*exp(1j*2*pi*n*k/N)/N;
    end
end

Xifft=ifft(X);
n=0:N-1;
f=fs/N*(0:N-1);

figure(1)
    subplot(4,1,1)
    plot(t,s); grid on; hold on;
    stem(ts, sp);

    subplot(4,1,2)
    stem(f, abs(X)); grid on; hold on;
    stem(f, abs(Xfft), 'r.');

    subplot(4,1,3)
    stem(f, angle(X)); grid on; hold on;
    stem(f, angle(Xfft), 'r.');

    subplot(4,1,4)
    stem(ts, real(Xinv)); grid on; hold on;
    stem(ts, real(Xifft), 'r.');