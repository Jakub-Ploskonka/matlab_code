%Odtwarzanie
clc; clear; close all;
N=5;
n=0:N-1;
x=[2,-1,-2,1,2];
fs=1/2; t0=1;
t=t0:0.1:13;
s=odtw(x,fs,t);

figure(1)
    plot(t,s); grid on;



function s = odtw(x,fs,t)
dt=1/fs;
N=length(x);
s=zeros(1,length(t));
for k=1:N
s=s+x(k)*sinc(fs*(t-k*dt));
end
end
