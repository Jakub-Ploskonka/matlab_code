clc; clear; close all;

% Chyba zjawisko przecieku 

k=10;    f0=2000;    fs=5000;

T=(2*k)/f0;
d=1000;
t=linspace(-T,T,d);
f=linspace(-5000,5000,d);
x=sin(2*pi*f0*t).*xPI(t,T,0);

ts=min(t):1/fs:max(t);
xs=sin(2*pi*f0*ts).*xPI(ts,T,0);

figure(1)
    subplot(2,1,1);
    plot(t,x,"b",'LineWidth',2); grid on; hold on;
    stem(ts,xs);

y=0;
for i=1:length(ts)
    y=y+xs(i).*sinc((t-ts(i))*fs);
end
plot(t,y,"g", "LineWidth", 2);

for n=1:length(f)
    X(n)=sum(x.*exp(-j*2*pi*f(n)*t))*d;
end

for n=1:length(f)
    X_prob(n)=sum(y.*exp(-j*2*pi*f(n)*t))*d;
end

subplot(2,1,2);
plot(f,abs(X)); grid on; hold on;
plot(f,abs(X_prob), 'g')
