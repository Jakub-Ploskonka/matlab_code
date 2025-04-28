% Metoda Whittakera-Shannona

clc; clear; close all;

f0 =  1; fs = 5; td=0.001; t=-4:td:4; 
T = 1/fs;
N = t(1):T:t(end);

s = sin(2*pi*f0*t);

xs = zeros(1,length(N));
for z=1:length(N)
    %xs(z) = fs*xintegral(s.*sinc(fs*(t-(N(z)))),td);
    xs(z) = 1/fs*xintegral(s.*sin(pi*fs*(t-(N(z)/fs)))/(pi*fs*(t-(N(z)/fs))),td);
end

figure(1)
    plot(t,s); hold on; grid on;
    stem(N,xs);
