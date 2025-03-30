clc; clear; close all;
% Kod rysuje sygnał ograniczony oknem prostoktnym
x=syg_do_prob(10,1000);

function x=syg_do_prob(k,f0)
    T=(2*k)/f0;
    t=linspace(-T,T,1000);
    x=sin(2*pi*f0*t).*xPI(t,T,0);

    figure(1)
        plot(t,x,"b"); grid on;
end

function x=xPI(t,T,pos)
    N=length(t);
    x=zeros(1,N);
    x((t>=(pos-T/2))&(t<=(pos+T/2))) = 1;
end