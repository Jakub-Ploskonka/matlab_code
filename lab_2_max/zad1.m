clc; clear; close all;
[t,s,ts,x] = syg_sin2(3,1000,5000);
[t2,s2,ts2,x2] = syg_sin2(3,1000,1000);


figure(1)
subplot(2,1,1);
plot(t,s); hold on;
stem(ts,x)

subplot(2,1,2);
plot(t2,s2); hold on;
stem(ts2,x2)

