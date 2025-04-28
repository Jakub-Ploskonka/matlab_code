%filter bo to nie filtr aliasingowy

clc; clear; close all;

td = 0.0001; k =2;  fs = 500; f0 = 40; T=1/fs;  t = -2*k/f0:td:2*k/f0; f=-fs:0.001:fs;

n = t(1)+rand*T:T:t(end);

s = cos(2*pi*f0*t);
w = xpi(t/(2*k/f0));
x = s.*w;

ss = cos(2*pi*f0*n);
ws = xpi(n/(2*k/f0));
xs = ss.*ws;

xr = zeros(1,length(t));
for z=1:length(n)
    %xr = xr + xs(z)*sinc(fs*(t-n(z)));
    xr = xr + xs(z)*sin(pi*fs*(t-n(z)))/(pi*fs*(t-n(z)));

end

%X = 2*k^2/(f0^2)*(sinc(f+f0)+sinc(f-f0));
X = 2*k^2/(f0^2)*(sin(pi*(f+f0))/(pi*(f+f0))+sin(pi*(f-f0))/(pi*(f-f0)));

figure(1)
    subplot(3,1,1)
        plot(t, x)
    subplot(3,1,2)
        stem(n, xs)
    subplot(3,1,3)
        plot(t,xr)
 figure(2)
    plot(f,X);
