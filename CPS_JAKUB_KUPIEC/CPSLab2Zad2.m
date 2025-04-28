%CPSLab2Zad2
%Aliasing
clc; close all; clear all;
f0=5; k=2; t=-5:0.001:5;
fs=10;
fi=0;

for i=1:5
    close all;
    y=CPS_lab1(t+fi,f0,k);
    %Próbkowanie
    N=10*fs;
    n=-N/2:N/2-1;
    ts=n/fs;
    x=CPS_lab1(ts+fi,f0,k);
    %Odtwarzanie
    odtw=zeros(1,length(t));
    for i=1:N
    odtw=odtw+x(i).*sin(pi*fs*(t-n(i).*(1/fs)))./(pi*fs*(t-n(i).*(1/fs)));
    end
    
    figure(1)
    plot(t,y,'b-'); hold on;grid on;
    plot(t,odtw,'g-'); hold on;
    stem(n/fs,x,'ro');hold on
    pause
    fi=fi+(1/4)*pi;
end