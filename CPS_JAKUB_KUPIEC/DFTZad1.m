%DFTZad1
clc; close all; clear;
dt=0.001;
t=0:dt:5;
f0=3;
fs=10;
s=1/4+sin(2*pi*f0*t);

N=fs*5;
n=0:N-1;
ts=n/fs;
x=1/4+sin(2*pi*f0*ts);

figure(1)
    plot(t,s,'b-');hold on; grid on;
    stem(ts,x,'go');