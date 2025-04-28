%LabDFT2Zad2
%DFT a Sz.Fouriera
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
T=1/f0;
N=fs/f0;
t=0:dt:T;
%s=-1/4-sin(2*pi*f0*t);
s=sin(2*pi*f0*t);
%Próbkowanie
n=0:N-1;
ts=n/fs;
%x=-1/4-sin(2*pi*f0*ts);
x=sin(2*pi*f0*ts);

%DFT
k=0:N-1;
n=0:N-1;
X=MyDFT(x);
f=k*fs/N;

%Fourier
c=0:N-1;
for i=1:N
    for l=1:length(t)
    c(i)=c(i)+(s(l).*exp(-1*j*2*pi*l*(i-1)/T));
    end
    c(i)=c(i)*dt/T;
end

figure(1)
 subplot(3,1,1)
     plot(t,s,'b-'); grid on; hold on;
     stem(ts,x,'go');
 subplot(3,1,2)
    stem(f,abs(X),'b-'); grid on; hold on;
 subplot(3,1,3)
    stem(f,abs(c),'b-'); grid on; hold on;
 