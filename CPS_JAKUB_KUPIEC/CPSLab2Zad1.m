%CPSLab2Zad1
%Probkowanie i oddtwarzanie
clc; close all; clear;
f0=1000; k=500; t=-1:0.0001:1;
fs=[100,200,500,1000,2000,4000,7000];
blad=zeros(length(fs),length(t));
%blod=zeros(1,length(fs));

%Funkcja
y=CPS_lab1(t,f0,k);
for l=1:length(fs)
    close all;
    %Próbkowanie
    N=2*fs(l);
    n=-N/2:N/2-1; 
    ts=n/fs(l);
    x=CPS_lab1(ts,f0,k);
    %Odtwarzanie
    odtw=zeros(1,length(t));
    for i=1:N
        odtw=odtw+x(i).*sin(pi*fs(l)*(t-n(i).*(1/fs(l))))./(pi*fs(l)*(t-n(i).*(1/fs(l))));
    end
    blad(l,:)=y-odtw;
    %blod(l)=sqrt(sum(blad.^2)*0.0001);
    figure(1)
        plot(t,y,'b-'); hold on;
        plot(t,odtw,'g-'); hold on;
         stem(n/fs(l),x,'ro');hold on
    pause;
end
%z=1:length(fs);
%figure(2)
%    plot(z,blod,'g-'); hold on