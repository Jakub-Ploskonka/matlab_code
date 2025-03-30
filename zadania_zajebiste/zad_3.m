clc; clear; close all;

k=10;    f0=2000;    %fs=5000;
p0=pi/2;

for i=1:40
    fs(i)=i*1000;
end

fs=[4000,5000];

T=(2*k)/f0;
t=linspace(-T,T,1000);
x=sin(2*pi*f0*t-p0).*xPI(t,T,0);

for n=1:length(fs)    
    ts=min(t):1/fs(n):max(t);
    xs=sin(2*pi*f0*ts-p0).*xPI(ts,T,0);
    figure(n)
        plot(t,x,"b",'LineWidth',2); grid on; hold on;
        stem(ts,xs);

    
    y=0;
    for i=1:length(ts)
        y=y+xs(i).*sinc((t-ts(i))*fs(n));
    end
    plot(t,y,"g", "LineWidth", 2);
    err(n)=max(abs(x-y));
end

%figure(10)
%    plot(fs,err); grid on; hold on;
%    stem(fs,err)