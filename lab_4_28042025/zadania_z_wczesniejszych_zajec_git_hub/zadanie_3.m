clc; clear; close all;

f0 = 3000;
dt = 1/(100*f0);
t = 0:dt:1e-3;
N = 10;

fs = 10000;
T_samp = 1/fs;
ts = 0:T_samp:(N-1)*T_samp;

s = -1/4 + sin(2*pi*f0*t);

x = zeros([1,length(ts)]);
for i=1:length(ts)
    nowe_t = ts(i);
    x(i) = -1/4 + sin(2*pi*f0*nowe_t);
end

[X,f] = dft(x);
[y,ty] = idft(X);

f = f * fs/N;
ty = ty .* 1/fs; 

figure(1);
subplot(2,1,1)
stem(f,abs(X));
title("abs(X(f))")
xlabel("f")
subplot(2,1,2)
stem(f,angle(X));
title("angle(X(f))")
xlabel("f")

figure(2);
subplot(2,1,1)
stem(ts,real(x),'b'); hold on;
stem(ty,real(y),'r+')
title("real(x) i real(y)")
xlabel("t")

subplot(2,1,2)
stem(ts,imag(x),'b'); hold on;
stem(ty,imag(y),'r+')
title("imag(x) i imag(y)")
xlabel("t")