clc;
clear;
close all;


% Sygnal podstawowy i probkowany
f0 = 3000;
fs = 9000;

N = 15;
n = 0:N-1;
to = 0;
ts = to + n/fs;

T = N/fs;
t = linspace(to,to+T,1e3+1);
t = t(1:end-1);
 

sygnal_analogowy = (1/4) + sin(2*pi*f0*t);
sygnal_probkowany = (1/4) + sin(2*pi*f0*ts);




% DFT 
x = sygnal_probkowany;

 N = length(x);
    X = zeros(1, N);
    
    for k = 0:N-1
        X(k+1) = sum(x .* exp(-1i * 2 * pi * k/N * (0:N-1)));
    end

X = abs(Dtf(sygnal_probkowany));


%TEST DFT
Z = abs(fft(x));


% Wykresy
figure(1)
subplot(3,1,1);
plot(t, sygnal_analogowy,'r-'); grid on; hold on;
stem(ts, sygnal_probkowany, 'bo','fill');

subplot(3,1,2);
stem(ts,X,'magenta');
title("DFT");

subplot(3,1,3)
stem(ts,Z,'r');
title("Testowe DFT");
