function [X,f]=cft(x,t)
%[X,f]=cft(x,t)
%
% Teoria sygnalow
% Elektronika
% AGH 
%
% Opracowal: P.Korohoda, 20/12/2022

X=fft(x);
X=fftshift(X);
N=length(x); dt=t(2)-t(1); fp=1/dt; df=fp/N;
f=0:df:(N-1)*df;
f=f-fp/2; 
X=X/fp;
X=X.*exp(-j*2*pi*f*t(1));

% EOF