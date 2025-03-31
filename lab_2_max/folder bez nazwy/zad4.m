clc; clear; close all;

k=3;
f0=1000;
fs=2*f0;
% fi = linspace(0,pi/4,65);
fi = [0, 1/4, 1/3, 1/2];
fi = pi*fi;
amplitudes = zeros([1,length(fi)]);
figure(1)
for i=1:length(fi)
    [t,s,ts,x,sa] = syg_sin_faza(k,f0,fs,fi(i));
    amplitudes(i) = max(x);
    subplot(length(fi),1,i)
    plot(t,s); hold on;
    plot(t,sa)
    stem(ts,x)
end

figure(2)
plot(fi,amplitudes);