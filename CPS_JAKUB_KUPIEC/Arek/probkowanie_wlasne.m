clc; clear; close all;

t = -4:0.001:4; f0 = 2; fs = 10;
s = sin(2*pi*f0*t);
[x, n] = sam(s, t, f0 ,fs);
figure(1)
    subplot(1,1,1)
        plot(t,s); grid on; hold on;
        stem(n, x);
