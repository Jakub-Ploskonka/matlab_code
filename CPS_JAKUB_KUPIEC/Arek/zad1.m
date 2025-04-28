clc;clear; close all;
k = 4;
f0 = 1000;
fs = 4100;
dt=1/(f0*1000);
t= -5/f0:dt:5/f0;

dS=1/fs;

dp=round(dS/dt);

s=pr_syg(t,k,f0);
t_new = -5/f0:dS:5/f0;
s_pr = pr_syg(t_new,k,f0);

plot(t,s,".r");
hold on;

stem(t_new,s_pr,"b");
sr=interp1(t_new,s_pr,t,'spline');
plot(t,sr,"g");
legend("Sygnał referencyjny","Sygnał spróbkowany","Sygnał odtworzony")
hold off;
grid on;