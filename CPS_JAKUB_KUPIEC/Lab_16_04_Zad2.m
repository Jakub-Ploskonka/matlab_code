%Lab_16_04_Zad2
close all; clc; clear;
f0=666;
N=20;

okno = 2;
switch okno
    case 0
        w = rectwin(N);
    case 1
        w = hamming(N);
    case 2
        w = hann(N);
    case 3
        w = blackman(N);
    case 4
        w = flattopwin(N);
end
%Tworzymy sygnal i przemnazamy przez okno
w = w';
ratio = sum(rectwin(N))/sum(w);
fs = 3000;
ts = 0:1/fs:(N-1)/fs;
x=sin(2*pi*f0*ts).*w*ratio;

f = 0:fs/N:fs - fs/N;
X = MyDFT(x);


M = 1000;
xr = [x,zeros(1,M)];
Xr = MyDFT(xr);
fr = 0:fs/(N+M):fs - fs/(N+M);

subplot(2,1,1)
    grid on;hold on;
    stem(f,abs(X)/N,'kx');
    plot(fr,abs(Xr)/N,'b-');
    %plot(fa,abs(XA)/N,'b');
subplot(2,1,2)
    grid on; hold on;
    stem(f,angle(X),'kx');
    plot(fr,angle(Xr)),'g-';