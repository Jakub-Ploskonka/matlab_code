%Gibbs
clc;clear;close all;

fs=1000;
N=1000;
t=linspace(-2,2,N);
x=xpi(t-0.5);
X=fft(x);
xf=zeros(1,N);
harmoniczne=300;
for i = 1:harmoniczne
    
    xf = xf + 4/pi * 1/(2*i-1) * sin((2*i-1)*pi*t);
    
end
Xf=fft(xf);
figure(1)
    plot(t,x);hold on;
    plot(t,xf);
figure(2)
    plot(t,X,'b-');hold on;
    plot(t,Xf,'r-');
errt = (abs(xf - x));
errf = (abs(Xf - X));
figure(3)
    plot(t,errt,'b-');hold on;
    plot(t,errf,'r-');
function y = xpi(t)
y(t<1/2 & t>-1/2) = 1;
y(t>1/2 | t<-1/2) = 0;
end