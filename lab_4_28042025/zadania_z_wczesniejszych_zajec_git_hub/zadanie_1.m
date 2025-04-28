clc; clear; close all;

f0 = 3000;
dt = 1/(100*f0);
t = 0:dt:1e-3;
N = 10;

fs = 10000;
T_samp = 1/fs;
ts = 0:T_samp:9*T_samp;

s = 1/4 + sin(2*pi*f0*t);

x = zeros([1,length(ts)]);
for i=1:length(ts)
    nowe_t = ts(i);
    x(i) = 1/4 + sin(2*pi*f0*nowe_t);
end


plot(t,s); hold on;
stem(ts,x)