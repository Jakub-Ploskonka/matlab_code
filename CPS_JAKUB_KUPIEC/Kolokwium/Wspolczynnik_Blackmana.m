%Wspolczynnik_Blackmana
clc; clear close all;
N=1000;
aref=N/sum(blackman(N));
w=zeros(1,N/2);
n=0:N/2-1;
w=0.42-0.5*cos(2*pi*n/(N-1))+0.08*cos(4*pi*n/(N-1));
a=N/(sum(w)*2);

figure(1)
    plot(blackman(N));hold on;
    plot(w)