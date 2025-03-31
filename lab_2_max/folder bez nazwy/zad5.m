clc; clear; close all;
fs = 1400;

[t,s,ts,x,sa] = syg_sin(3,1000,fs);
% f = linspace(-fs/2,fs/2,length(t));
% f = linspace(0,fs,length(t));
f = linspace(-1,1,length(t));

dt = t(2) - t(1);

sf = zeros(1, length(f));
for i=1:length(f)
    sf(i) = calka(s.*exp(-j*2*pi*t*f(i)),dt);
end


saf = zeros(size(f));
for i=1:length(ts)
    saf = saf + x(i) * (1/fs) .* my_pi(f/fs) .* exp(-j*2*pi*f*ts(i));
end


figure(1);
subplot(2,1,1);
plot(t,s);
subplot(2,1,2);
plot(t,sa);

figure(2);
subplot(2,1,1);
plot(f,abs(sf));
subplot(2,1,2);
plot(f,abs(saf));

