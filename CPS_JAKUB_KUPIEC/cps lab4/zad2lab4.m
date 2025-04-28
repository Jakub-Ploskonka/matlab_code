close all; clc; clear;
przypadek = 2
okno = 3
for N = 400
switch przypadek 
    case 1
        fo = 600; to = 0; 
    case 2
        fo = 666; to = 0; 
end
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
w = w';
ratio = sum(rectwin(N))/sum(w);
fs = 3000;


ts = to:1/fs:(N-1)/fs + to;

xs = ( sin(2*pi*fo*ts)  ).*w*ratio;

f = 0:fs/N:fs - fs/N;
XS = DFT(xs).';


M = 1000;
xsr = [xs,zeros(1,M)];
XSr = DFT(xsr);
fr = 0:fs/(N+M):fs - fs/(N+M);


%sygnal analogowy
dt = 0.00001;
ta = to:dt:to+N/fs;
xa = zeros(size(ta));
for i = 1:N
    xa = xa + xs(i)*sinc((ta-i*1/fs)*fs);
end
fa = -fs/2:0.1:fs/2;
XA = zeros(size(fa));
% for i = 1:length(fa)
% XA(i) = trapz(ta,xa.*exp(-j*2*pi*fa(i)*ta));
% end
for q = 1:length(xs)
    XA = XA + xs(q)*XPI(fa/fs).*exp(-j*2*pi*fa*q/fs);
end


subplot(2,1,1)
grid on;hold on;
stem(f,abs(XS)/N,'kx');
plot(fr,abs(XSr)/N);
%plot(fa,abs(XA)/N,'b');
subplot(2,1,2)
grid on; hold on;
stem(f,angle(XS),'kx');
plot(fr,angle(XSr));
end