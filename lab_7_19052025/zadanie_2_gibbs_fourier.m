
% porównuje oryginalny sygnał prostokątny z jego przybliżeniem szeregiem Fouriera oraz analizuje różnice między nimi w dziedzinie czasu i częstotliwości
clear all; close all; clc;


harmoniczne = 500;        % liczba harmonicznych użyta w szeregu Fouriera
dt = 0.0001;            % krok czasowy
L = 2;                  % długość okresu (w kontekście Fouriera)
A = 0.25;               % amplituda sygnału
const = 0.5;            % składowa stała (offset)
x = -1:dt:1-dt;         % wektor czasu
Z = 0;                  % ewentualne rozszerzenie sygnału zerami

% Obliczenie osi częstotliwościowej
f = -1/(2*dt):1/dt/(length(x)+Z):1/(2*dt)-1/dt/(length(x)+Z);

% Przybliżenie sygnału prostokątnego szeregiem Fouriera
fourier = ones(size(x))*const;

for i = 1:harmoniczne
    
    fourier = fourier + A*2 * 4/pi * 1/(2*i-1) * sin((2*i-1)*pi*x/L);
    
end

% Stworzenie sygnału prostokątnego
syg11 = [-2*A*2*xpi(x+0.5)+1*2*A + const,zeros(1,Z)];

% Sygnał aproksymowany szeregiem Fouriera
syg22 = [fourier,zeros(1,Z)];

% Transformacje Fouriera
syg1 = fft(syg11);
syg2 = fft(syg22);

% Obliczanie błędów
errt = max(abs(syg22 - syg11));
errf = max(abs(syg1 - syg2));
roznicaf = fftshift(syg2)-fftshift(syg1);

% Odtwarzanie sygnałów odwrotną FFT
ifftsyg1 = ifft(syg1);
ifftsyg2 = ifft(syg2);

figure(1)
subplot(5,1,1)
hold on; grid on;
plot(x,-2*A*2*xpi(x+0.5)+1*2*A + const);
plot(x,fourier,'k');
title('sygnały czasowe (oryginał i przybliżenie');


subplot(5,1,2)
hold on; grid on;
plot(f,abs(fftshift(syg1)));
plot(f,abs(fftshift(syg2)),'k');
xlim([-20,20])
title('moduły widm (FFT)');

subplot(5,1,3)
hold on; grid on;
plot(f,abs(roznicaf),'k');
xlim([-20,20])
title('różnica widm');

subplot(5,1,4)
hold on; grid on;
plot(syg22 - syg11);
title('różnica w dziedzinie czasu');

subplot(5,1,5)
hold on; grid on;
plot(ifft(fftshift(roznicaf)),'b');
title('odwrotna FFT z różnicy widm');

% xpi(T)
function y = xpi(t)
y(t<1/2 & t>-1/2) = 1;
y(t>1/2 | t<-1/2) = 0;
end