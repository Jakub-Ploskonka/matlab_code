clear all; close all; clc;
harmoniczne = 300;
dt = 0.0001;
L = 2;
A = 0.25;
const = 0.5;
x = -1:dt:1-dt;
Z=0;
f = -1/(2*dt):1/dt/(length(x)+Z):1/(2*dt)-1/dt/(length(x)+Z);
fourier = ones(size(x))*const;

for i = 1:harmoniczne
    
    fourier = fourier + A*2 * 4/pi * 1/(2*i-1) * sin((2*i-1)*pi*x/L);
    
end
syg11 = [-2*A*2*xpi(x+0.5)+1*2*A + const,zeros(1,Z)];
syg22 = [fourier,zeros(1,Z)];
syg1 = fft(syg11);
syg2 = fft(syg22);


errt = max(abs(syg22 - syg11));
errf = max(abs(syg1 - syg2));
roznicaf = fftshift(syg2)-fftshift(syg1);

ifftsyg1 = ifft(syg1);
ifftsyg2 = ifft(syg2);
subplot(5,1,1)
hold on; grid on;
plot(x,-2*A*2*xpi(x+0.5)+1*2*A + const);
plot(x,fourier,'k');

subplot(5,1,2)
hold on; grid on;
plot(f,abs(fftshift(syg1)));
plot(f,abs(fftshift(syg2)),'k');
xlim([-20,20])

subplot(5,1,3)
hold on; grid on;
plot(f,abs(roznicaf),'k');
xlim([-20,20])

subplot(5,1,4)
hold on; grid on;
plot(syg22 - syg11);


subplot(5,1,5)
hold on; grid on;
plot(ifft(fftshift(roznicaf)),'b');


