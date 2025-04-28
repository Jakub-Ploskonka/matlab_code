clc; clear; close all;

f0 = 3000;
dt = 1/(100*f0);
t = 0:dt:1e-3;
N = 10;

fs = 10000;
T_samp = 1/fs;
ts = 0:T_samp:(N-1)*T_samp;

s1 = 1/4 + sin(2*pi*f0*t);
s2 = 1/2 + cos(2*pi*f0/2*t);

% x = zeros([1,length(ts)]);
x1 = zeros([1,length(ts)]);
x2 = zeros([1,length(ts)]);

for i=1:length(ts)
    nowe_t = ts(i);
    x1(i) = 1/4 + sin(2*pi*f0*nowe_t);
    x2(i) = 1/2 + cos(2*pi*f0/2*nowe_t);
end
x = x1+x2;

[y,f] = dft(x);
y_ref = fft(x);

[xa,ta] = idft(y);
xa_ref = ifft(y);

blad_dft = max(abs(y-y_ref))
blad_idft = max(abs(xa-xa_ref))


figure(1);
subplot(3,1,1);
stem(f,abs(y),'b'); hold on;
title("DFT i FFT");

subplot(3,1,3);
stem(ta,abs(xa),'b');hold on;
stem(ta,abs(xa_ref),'r+');
title("IDFT i IFFT");