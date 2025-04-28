clc; clear; close all;

td = 0.001; f0 = 1; A1 = 2; fs= [2 6 8 10 15 30]; fs=4;
t=-4:td:4;
f = -16:0.004:16;
x = cos(2*pi*f0*t).*xpi(t);
X = 
figure(1)
subplot(3,1,1)
    plot(t,x);
subplot(3,1,2)
    plot(f,real(X));
    subplot(3,1,3)
    plot(t,xr);

