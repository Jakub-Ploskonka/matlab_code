clear; clc; close all;
fo = 4000;
fs = 12000;
to = 0;
N = 21;

%Klasyczny
T = N/fs;
t = linspace(to,to+T,1e3);
t = t(1:end-1);
dt = t(2) - t(1);
s = -1/4 - sin(2*pi*fo*t);


n = 0:N-1;
ts = to + n/fs;
x = -1/4 - sin(2*pi*fo*ts);


fg = (N-1)/2;
fk = (-fg:fg) * fs/N;
%Porównanie funkcji DFT i fft - Klasyczny

X = DFT(x);
X = fftshift(X);






%Wykresiki Zestaw 1
figure(1) %Klasyczny s(t) i x(t)
    plot(t, s, 'r'); hold on; grid on;
    stem(ts, x, 'bo')

figure(2) %Klasyczny s(t) i x(t)
    plot(t, s2, 'r'); hold on; grid on;
    stem(ts, x2, 'bo')

figure(3); %Widmo amplitudowe x(t) -> X(f) - Porównanie
    stem(fk, abs(X), 'bo-', 'MarkerSize', 4); hold on; grid on;
    stem(fk, abs(X2), 'r.--');

figure(4); %Widmo fazowe x(t) -> X(f)
    stem(fk, angle(X)/pi, 'r-'); grid on; hold on;
    stem(fk, angle(X2)/pi, 'bo--', 'MarkerSize', 4); 
