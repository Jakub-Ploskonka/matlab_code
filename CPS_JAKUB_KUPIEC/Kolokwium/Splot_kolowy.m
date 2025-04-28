%Splot_Kolowy
clc; clear; close all;
fs=2000;
N=100;
n=0:N-1;
tx=n/fs;
x=sin(2*pi*5*tx)+sin(2*pi*100*tx);
R=50;
h=fir1(R,1/20,hamming(R+1));

y=splot_kol(h,x);
yref=cconv(h,x);

figure(1)
    stem(y,'bo');grid on; hold on;
    stem(yref,'rx');
function y = splot_kol(h,x)
M=length(h);
N=length(x);
K=M+N-1;
H=fft(h,K);
X=fft(x,K);
Y=X.*H;
y=ifft(Y);
end