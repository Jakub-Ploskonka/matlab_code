%Splot_liniowy
clc; clear; close all;

N=100;
n=0:N-1;
fs=500;
tx=n/fs;
x=sin(2*pi*5*tx)+sin(2*pi*100*tx);

R=40;
h=fir1(R,1/10,hamming(R+1));

y=splot_lin(h,x);
yref=conv(h,x);

figure(1)
    stem(y,'bo');grid on; hold on;
    stem(yref,'rx');


function y = splot_lin(h,x)
M = length(h);
N = length(x);
K = N+M-1;
x=[x,zeros(1,M-1)];
h=[h,zeros(1,N-1)];
y=zeros(1,K);
for i=1:K
y=y+x(i)*h;
h=[0,h(1:end-1)];
end
end