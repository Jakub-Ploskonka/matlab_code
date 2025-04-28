%Efekt Gibbsa
%
%M74
%
%Jakub Kupiec
clc; clear;close all;
N=1000;
t=linspace(-2,2,N);
x=xpi(t-0.5);
%Sygnał przybliżony
xf=zeros(1,N);
harmoniczne = 200;
for i=1:harmoniczne
xf=xf+4/pi*1/(2*i-1)*sin((2*i-1)*pi*t);
end
figure(1)
    plot(t,x,'g-');grid on; hold on;%Syg oryginalny
    plot(t,xf);%Syg przybliżony

X=fftshift(fft(x));
Xf=fftshift(fft(xf));

fs=250;
f=0:fs/N:fs-fs/N;
figure(2)
    plot(f,abs(X),'g-');grid on; hold on;
    plot(f,abs(Xf));

%Teraz należy sprawdzić czy te same różnice otrzymujemy w czasie co w
%częstotliwości
errt=abs(x)-abs(xf);
errf=abs(X)-abs(Xf);
xx=ifft(X);
xff=ifft(Xf);
errt1=abs(xx)-abs(xff);


figure(3)
subplot(2,1,1)
    plot(errt,'g-');grid on; hold on;
subplot(2,1,2)
    plot(errf,'b-');grid on; hold on;

%DO stworzenia sygn na którym demonstrujemy efekt Gibbsa
function y=xpi(t)
y(t<1/2&t>-1/2)=1;
y(t>1/2 | t<-1/2)=0;
end
