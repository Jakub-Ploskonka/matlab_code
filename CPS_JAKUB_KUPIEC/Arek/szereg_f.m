% Szereg fouriera na 2 sposoby

clc; clear; close all;

dt=0.01; t=-2:dt:2; 
x = xpi(t);

xSzer = zeros(1,length(t));
T = 10; ft = 1/T;
for n=1:1000
    N = n-1;
    fn = ft*N;
    an(n) = 2/T * calka(x.*cos(2*pi*fn*t),dt);
    bn(n) = 2/T * calka(x.*sin(2*pi*fn*t),dt);
    xSzer = xSzer + an(n)/2.*cos(2*pi*fn*t)+bn(n).*sin(2*pi*fn*t);
end

xSzer2 = zeros(1,length(t));
for n=1:1000
    N = n-1;
    fn = ft*N;
    c(n) = 1/T*calka(x.*exp(-j*2*pi*fn*t),dt);
    xSzer2 = xSzer2 + c(n).*exp(j*2*pi*fn*t);
end
blad1 = sum(abs(x-xSzer))
blad2 = sum(abs(x-real(xSzer2)))
figure(1)
    subplot(3,1,1)
        plot(t,x, "r");
        title('Wykres sygnału x');
    subplot(3,1,2)
        plot(t,xSzer, "g");
        title('Wykres szeregu Fouriera obliczany klasycznie');
    subplot(3,1,3)
        plot(t,real(xSzer2), "b");
        title('Wykres szeregu Fouriera obliczany wzorem zespolonym');
figure(2)
    subplot(2,1,1)
        plot(t,(x-xSzer), "g");
        title('Wykres błędu f1');
    subplot(2,1,2)
        plot(t,x-abs(xSzer2), "b");
        title('Wykres błędu f2');
