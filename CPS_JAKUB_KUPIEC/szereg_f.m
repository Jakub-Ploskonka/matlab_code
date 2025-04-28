clc; clear; close all;

dt = 0.01;
t = -2:dt:2;
x = xpi(t);

T = 10;
ft = 1 / T;
xSzer = zeros(1, length(t));

for n = 1:1000
    N = n - 1;
    fn = ft * N;
    c(n) = (1 / T) * xintegral(x .* exp(-1j * 2 * pi * fn * t / T), dt);
    xSzer = xSzer + c(n) .* exp(1j * 2 * pi * fn * t / T);
end
xSzer = (2 / T) * xSzer;
blad2 = sum(abs(x - real(xSzer)));

X = fft(x);
XSzer = fft(xSzer);
f = -1 / (2 * dt):1 / dt / (length(x)):1 / (2 * dt) - 1 / dt / (length(x));

figure(1)
subplot(2, 1, 1)
plot(t, x, 'r'); hold on; grid on;
plot(t, real(xSzer), 'b');
title('Wykres sygnału x');

subplot(2, 1, 2)
plot(f, fftshift(real(X))); hold on; grid on;
plot(f, fftshift(real(XSzer)));
xlim([-20 20]);
title('Transformaty Fouriera');

figure(2)
subplot(2, 1, 1)
plot(t, (x - real(xSzer)), 'g');
title('Wykres błędu f1');

subplot(2, 1, 2)
plot(t, x - abs(xSzer), 'b');
title('Wykres błędu f2');
