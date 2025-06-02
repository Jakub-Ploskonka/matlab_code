% Autor Jakub Płoskonka
% 26 05 2025
% zadanie 1 splot liniowy i kolowy
% zadanie 2 odpowiedz impulsowa
% zadanie 3 charakterystyka czestotliwosciowa

clc; clear; close all;
% Zadanie 1
syg = 1;
switch syg
    case 0
        N = 200;
        n = 0 : N-1;
        fs = 100;
        ts = n/fs;
        x = xpi((ts-1)/1.01);   % sygnał wejściowy x(t)
        K = 51;
        k = 0 : K-1;
        ts1 = k/fs; 
        h = 1/5 * sinc(fs/5 * (ts1-0.25));    % funkcja sinc symulująca filtr
    case 1
        N = 400;
        n = 0 : N-1;
        fs = 100;
        ts = n/fs;
        x = xpi((ts-2)/3) .* (sin(6*pi*ts) + sin(92*pi*ts));
        K = 51;
        k = 0:K-1;
        ts1 = k/fs;
        h= 1/13 * sinc(fs/13 * (ts1-0.25));
end

%M = N;
M = N + K-1;
%M = N + K + 66; % M >= N + K

%Liniowy
y = conv(h,x);
y1 = My_Conv(h,x);
%y1_dostosowane = [y1, zeros(1, M - length(y1))];

m = 0 : M-1;
ts2 = m/fs;

%Kołowy
X = fft(x,M);
H = fft(h,M);
%ykol = ifft(X .* H);
ykol = MyCConv(x, h);



figure(1)
    subplot(5,1,1)
        plot(ts,x, 'ro');
        grid on; hold on;
        title('x(t) – sygnał wejściowy');
        xlabel('Czas [s]');
    subplot(5,1,2)
        plot(ts1,h, 'bo');
        grid on; hold on;
        title('h(t) – odpowiedź impulsowa (filtr)');
        xlabel('Czas [s]');
    subplot(5,1,[3 5])
        plot(ts,x, 'ko:'); grid on, hold on;
        plot(ts2, y1 , 'bo'); 
        plot(ts2,ykol, 'rx');
        title('Porownanie sygnal wejsciowy sp. liniowy, kolowy');
        xlabel('Czas [s]');
        

% Zadanie 2 – Odpowiedź impulsowa systemu
zp = 30;
hx = [h, zeros(1,zp)];
odp_imp = My_odp_imp(hx,zp);
odp_imp1 = impz(hx);
Dt = 1/fs;
tl = 0 : Dt : Dt*length(odp_imp)-Dt;

figure(2)
    subplot(2,1,1)
        plot(tl,odp_imp);
        grid on; hold on;
        title('Moja odp impulsowa');
        xlabel('Czas [s]');
    subplot(2,1,2)
        plot(tl,odp_imp1);
        grid on; hold on;
        title('Wbudowana odp impulsowa');
        xlabel('Czas [s]');


% % Zadanie 3 – Charakterystyka częstotliwościowa

% FFT bez zmiany K
Hcz = fft(h, K);
Hcz_shifted = fftshift(Hcz);
f = (-K/2 : K/2 - 1) * (fs/K);

N = length(h);
X = MyDFT(h);

% ratio - współczynnik normalizacyjny, kompensuje spadek
% amplitudy spowodowany zastosowaniem danego okna

w1 = hamming(N);
w1 = w1';
ratio = sum(rectwin(N)) / sum(w1);
xs1 = h .* w1 * ratio;
XS1 = fft(xs1);

M = 100;
xsr = [h,zeros(1,M)];
XSr = fft(xsr);
fr = 0 : fs/(N+M) : fs - fs/(N+M);


figure(6)
    grid on;hold on;
    stem(fr,(abs(XSr)/N));
    title('Modul');
    xlabel('Czestotliwosc [Hz]');
    ylabel('Amplituda');
        
 
 figure(7)
    grid on;hold on;
    stem(fr,(angle(XSr)/pi));
    title('Faza');
    xlabel('Czestotliwosc [Hz]');
    ylabel('Amplituda');
        


% Funkcje
% xpi
function y = xpi(x)
y = zeros(size(x));
y(abs(x)<1/2)=1;
y(abs(x)==1/2)=1/2;
end

%My_Conv
% h - impulsowa odpowiedź systemu (np. filtr)
% x – sygnał wejściowy
% splotLiniowy – wynik splotu liniowego sygnałów h i x
function splotLiniowy = My_Conv(h,x)

% Obliczenie długości
M = length(h);
N = length(x);
K = N + M - 1;

splotLiniowy = zeros(1,K);
hk = [h,zeros(1,N-1)];
xk = [x,zeros(1,M-1)];

% Petla wykonujaca splot
for m = 1:K
       splotLiniowy = splotLiniowy + xk(m) * hk;
       hk = [0,hk(1:end-1)];
end
end

%MyCConv
function cc = MyCConv(x,h)

L = length(x)+length(h)-1;

x = [x, zeros([1,L-length(x)])];
h = [h, zeros([1,L-length(h)])];

cc = ifft(fft(x).*fft(h));
cc = cc(1:L);
end

% My_odp_imp
function y = My_odp_imp(h,L)

if (L < length(h))
    L = length(h);
end
y = zeros(1,L);                     % wynik
hk = [h, zeros(1, L-length(h))];    % odpowiedź impulsowa rozszerzona zerami
x = [1, zeros(1, L-1)];              % impuls jednostkowy

for m=1:L
   y = y + hk(m) * x;
   x = [0, x(1:end-1)];
end
end

%MyDFT
function X=MyDFT(x)
N=length(x);
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
X=A*x(:);
end
