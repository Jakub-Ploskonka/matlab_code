% Autor Jakub Płoskonka
% 26 05 2025
% zadanie 4
% Generowanie sygnału x i odpowiedzi impulsowej h
% Obliczenie transformaty Z sygnałów x i y
% obliczenie transmitancji i miejsc zerowych/biegunów
clc; clear; close all;


% Generowanie sygnału x i odpowiedzi impulsowej h
N = 200;
n = 0:N-1;
fs = 100;
ts = n/fs;
x = xpi((ts-1)/1.01);
K = 51;
k = 0:K-1;
ts1 = k/fs;
h = 1/20*sinc(fs/20*(ts1-0.25));
% Splot sygnału z odpowiedzią impulsową
y = conv(h,x);

% Obliczenie transformaty Z sygnałów x i y
dz = 0.1;
[X,Y] = meshgrid(-4:dz:4,-4:dz:4);
z = X+j*Y;
Zy = zeros(length(z(1,:)),length(z(:,1)));
    for k = 1:length(z(1,:))
        for l = 1:length(z(:,1))
            for i = 1:N
                Zy(k,l) = Zy(k,l)+y(i)*z(k,l)^(-(i-3));
            end
        end
    end

dz = 0.1;
[X,Y] = meshgrid(-4:dz:4,-4:dz:4);
z = X+j*Y;
Zx = zeros(length(z(1,:)),length(z(:,1)));
    for k = 1:length(z(1,:))
        for l = 1:length(z(:,1))
            for i = 1:N
                Zx(k,l) = Zx(k,l)+x(i)*z(k,l)^(-(i-3));
            end
        end
    end

 figure(1)
 subplot(2,1,1)
        mesh(X,Y,abs(Zy));
        grid on;
 subplot(2,1,2)
        mesh(X,Y,abs(Zx));
        grid on;


 % Obliczenie transmitancji i miejsc zerowych/biegunów
 Zh = Zy ./ Zx;
 zer = zero(Zh);
 p = pole(Zh);


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
 

 
