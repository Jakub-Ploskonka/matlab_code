%
%
%
%
%
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

%NieKlasyczny - Punkt4b
t2 = linspace(-2*(to+T),2*(to+T),1e3);
t2 = t2(1:end-1);
dt2 = t2(2) - t2(1);
s2 = -1/3 - sin(2*pi*fo*t2);

k = -2*N:2*N; 
ts2 = to + k/fs;
x2 = -1/3 - sin(2*pi*fo*ts2);

%Porównanie funkcji DFT i fft - Klasyczny
fg = (N-1)/2;
fk = (-fg:fg) * fs/N;

X = DFT(x);
X =fftshift(X);

Xfft = fft(x);
Xfft = fftshift(Xfft);

%Porównanie funkcji DFT i fft - Klasyczny
fg2 = 2 * N;
fk2 = (-fg2:fg2) * fs/(4*N);

X2 = DFT(x2);
X2 =fftshift(X2);

Xfft2 = fft(x2);
Xfft2 = fftshift(Xfft2);

%CFT sygnału ciągłego - Klasyczny
S = CFT(s, fk, t, dt);

%CFT sygnału ciągłego - NieKlasyczny
S2 = CFT(s2, fk2, t2, dt2);

%Rekonstrukcja
t_p = to:(1/fs):to+T;
srec = reconstruct(x, t, t_p, fs);

t_p2 = -2*(to+T):(1/fs):2*(to+T);
s2rec = reconstruct(x2, t2, t_p2, fs);

%Wykresiki Zestaw 1
figure(1) %Klasyczny s(t) i x(t)
plot(t, s, 'r'); hold on; grid on;
stem(ts, x, 'bo')

figure(2); %Widmo amplitudowe x(t) -> X(f) - Porównanie
plot(fk, abs(X), 'b.'); hold on; grid on;
plot(fk, abs(Xfft), 'g-');

figure(3); %Widmo fazowe x(t) -> X(f)
stem(fk, angle(X)/pi, 'r-.'); grid on; hold on;

figure(4); %Widmo sygnału s(t) -> S(f) - funkcja CFT
plot(fk, abs(S), 'b.-'); hold on; grid on;

figure(5) %Rekonstrukcja s2 -> s2rec
plot(t, s, 'r.'); hold on; grid on;
plot(t, srec, 'b-')

%Wykresiki Zestaw 2
figure(6) %NieKlasyczny s2(t) i x2(t)
plot(t2, s2, 'r'); hold on; grid on;
stem(ts2, x2, 'bo')

figure(7); %Widmo amplitudowe x(t) -> X(f) - Porównanie
plot(fk2, abs(X2), 'b.'); hold on; grid on;
plot(fk2, abs(Xfft2), 'g-');

figure(8); %Widmo fazowe x(t) -> X(f)
stem(fk2, angle(X2)/pi, 'r-.'); grid on; hold on;

figure(9); %Widmo sygnału s(t) -> S(f) - funkcja CFT
plot(fk2, abs(S2), 'b.-'); hold on; grid on;

figure(10) %Rekonstrukcja s2 -> s2rec
plot(t2, s2, 'r.'); hold on; grid on;
plot(t2, s2rec, 'b-')


