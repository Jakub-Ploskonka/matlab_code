% Autor Jakub Płoskonka
% 12 05 2025
% zadanie 2_1
% Aliasing w dft
clc; clear; close all;
dt = 0.00001;
f0 = 400;
f1 = 700;
fs = 1500;
N = 100;
to = 0;
t = to : dt : N/fs;
s = sin(2*pi*f0*t) + sin(2*pi*f1*t);

n = 0 : N-1;
ts = n/fs;
x = sin(2*pi*f0*ts) + sin(2*pi*f1*ts);
f = n * fs/N;

X=fft(x);

figure(1)
    plot(f,abs(X),'b-', LineWidth=2);hold on; grid on;
    xlabel('Czestotliwosc');
    ylabel('Amplituda');
    title('Aliasing - zakłócenia widma')

