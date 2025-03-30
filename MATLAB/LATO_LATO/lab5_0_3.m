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

Xfft = fft(x);
Xfft = fftshift(Xfft);


%Wykresiki Zestaw 1
figure(1) %Klasyczny s(t) i x(t)
    plot(t, s, 'r'); hold on; grid on;
    stem(ts, x, 'bo')

figure(2); %Widmo amplitudowe x(t) -> X(f) - Porównanie
    stem(fk, abs(X), 'bo-', 'MarkerSize', 4); hold on; grid on;
    stem(fk, abs(Xfft), 'r.--');

figure(3); %Widmo fazowe x(t) -> X(f)
    stem(fk, angle(X)/pi, 'r-'); grid on; hold on;
    stem(fk, angle(Xfft)/pi, 'bo--', 'MarkerSize', 4); 


    clear; clc;
fo = 4000;
fs = 12000;
to = 0;
N = 24;

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
fk = (-fg:fg) * fs/N - fs/(2*N);
%Porównanie funkcji DFT i fft - Klasyczny

X = DFT(x);
X = fftshift(X);

Xfft = fft(x);
Xfft = fftshift(Xfft);


%Wykresiki Zestaw 1
figure(4) %Klasyczny s(t) i x(t)
    plot(t, s, 'r'); hold on; grid on;
    stem(ts, x, 'bo')

figure(5); %Widmo amplitudowe x(t) -> X(f) - Porównanie
    stem(fk, abs(X), 'bo-', 'MarkerSize', 4); hold on; grid on;
    stem(fk, abs(Xfft), 'r.--');

figure(6); %Widmo fazowe x(t) -> X(f)
    stem(fk, angle(X)/pi, 'r-'); grid on; hold on;
    stem(fk, angle(Xfft)/pi, 'bo--', 'MarkerSize', 4);    