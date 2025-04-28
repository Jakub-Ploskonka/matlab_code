clc; clear; close all;

td = 0.001; f1 = 1; f2 = 4; A1 = 2; A2 = -3; fs= [2 6 8 11 15 30];
t=0:td:4;
y=kcoscos(t,f1,f2,A1, A2);

figure(1)
    for i=1:length(fs)
        plot(t,y, '.'); grid on; hold on;
        n = 0:1/fs(i):4;
        ys = kcoscos(n,f1,f2,A1,A2);
        yr = interp1(n,ys,t,"spline");
        stem(n,ys); 
        plot(t,yr, '.');
        pause;
        hold off;
    end

    
