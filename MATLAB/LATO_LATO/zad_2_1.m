clc; clear; close all;

% Rysuje sygnał analogowy i odtwarza go z ustawionych próbek

f0=2400;    fs=9000;    N=15;
dt=1/fs;    td=dt*(N-1);
t=linspace(0,N/fs,10000);
n=0:N-1;
ts=n/fs;

s=-0.25+sin(2*pi*f0*t);
sp=-0.25+sin(2*pi*f0*ts);

figure(1)
    plot(t,s); grid on; hold on;
    stem(ts, sp);