close all; clc; clear;
przypadek = 1

switch przypadek 
    case 1
        fo = 600; to = 0; N = 20;
    case 2
        fo = 666; to = 0; N = 20;
end

fs = 3000;


ts = to:1/fs:(N-1)/fs + to;

xs = sin(2*pi*fo*ts);

f = 0:fs/N:fs - fs/N
XS = DFT(xs)';


M = 1000
xsr = [xs,zeros(1,M)];
ta = to:1/fs:(M-1)/fs + to;
XA = fft(sin(2*pi*fo*ta))
fa = 0:fs/M:fs - fs/M
XSr = DFT(xsr);
fr = 0:fs/(N+M):fs - fs/(N+M)

subplot(2,1,1)
grid on;hold on;
stem(f,abs(XS)/N,'kx');
plot(fr,abs(XSr)/N);
subplot(2,1,2)
grid on;
stem(f,angle(XS));
plot(fr,angle(XSr));
