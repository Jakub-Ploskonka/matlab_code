%Sygnał analogowy i próbkowany


clc;
clear;
close all;



f0 = 600;
f0_2= 666;
fs = 3000;

N = 30;
n = 0:N-1;
to = 0;
ts = to + n/fs;

T = N/fs;
t = linspace(to,to+T,1e3+1);
t = t(1:end-1);

%sygnał dla fo = 600 Hz
sygnal_analogowy = sin(2*pi*f0*t);
sygnal_probkowany = sin(2*pi*f0*ts);

%sygnał dla fo = 666 Hz
sygnal_analogowy_2 = sin(2*pi*f0_2*t);
sygnal_probkowany_2 = sin(2*pi*f0_2*ts);
    
figure(1)
plot(t, sygnal_analogowy,'r-'); grid on; hold on;
stem(ts, sygnal_probkowany, 'bo','fill');
title("Wykres dla częstotliwości fo= 600Hz");

figure(2)
plot(t, sygnal_analogowy_2,'r-'); grid on; hold on;
stem(ts, sygnal_probkowany_2, 'bo','fill'); grid on; hold on;
title("Wykres dla częstotliwości fo= 666Hz");

