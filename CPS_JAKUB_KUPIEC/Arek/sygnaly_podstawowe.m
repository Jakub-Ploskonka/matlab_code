clc; clear; close all;

td = 0.001; t=-2:td:2;

y = xtri(t);
z = xsaw(t);
x = xpi(t);

figure(1)
    subplot(3,1,1)
        plot(t, y);
    subplot(3,1,2)
        plot(t, z);
    subplot(3,1,3)
        plot(t, x);