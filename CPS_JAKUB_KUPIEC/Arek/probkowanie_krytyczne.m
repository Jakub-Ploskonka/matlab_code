%przykład próbkowania krytyczngo 

clc; clear; close all;

td = 0.001; t=-6:td:6; f0=1; fs=4; fi=[0 pi/6 pi/4 pi/3 pi/2];
N=round(2*pi*fs);
n = -6:1/fs:6;

for i=1:length(fi)
    x = sin(2*pi*f0*t - fi(i));
    xs = sin(2*pi*f0*n-fi(i));
    xr = interp1(n,xs, t, "spline");
    figure(1)
        plot(t,x); grid on; hold on;
        xlim([-pi pi])
        stem(n,xs);
        plot(t, xr, 'o'); 
        title("Przykład próbkowania krytycznego (fi = pi/2)");
        xlabel("Czas [s]");
        ylabel("Amplituda");
        legend("Sygnał oryginalny", "Próbki", "Interpolacja");
        pause;  
       hold off;
end