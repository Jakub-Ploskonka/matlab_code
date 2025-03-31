function [t,s] = sin_faza(f0,fi)
k = 3;
tmax = 1/(f0)*2;
dt = tmax/1e2;
t = -tmax:dt:tmax;
s = sin(2*pi*f0.*t+fi)