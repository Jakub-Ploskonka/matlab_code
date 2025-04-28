%Lab_16_04_Zad1V1
clc; clear; close all;
dt=0.00001;
N=20;
fs=3000;
t=0:dt:(N)/fs;
n=0:N-1;
ts=n/fs;

        %a
f0=600;
s1=sin(2*pi*f0*t);
x1=sin(2*pi*f0*ts);

%DFT
X1=MyDFT(x1);
k=n;
f=k*fs/N;

        %b
f0=666;
s2=sin(2*pi*f0*t);
x2=sin(2*pi*f0*ts);

%DFT
X2=MyDFT(x2);

%Rozszerzanie zerami
M = 1000;
xr1 = [x1,zeros(1,M)];
xr2 = [x2,zeros(1,M)];
tr = 0:1/fs:(M-1)/fs;

%fz = 0:fs/M:fs - fs/M
Xr1 = MyDFT(xr1);
Xr2 = MyDFT(xr2);
fr = 0:fs/(N+M):fs - fs/(N+M);

figure(1)
    subplot(4,1,1)
        grid on;hold on;
        stem(f,abs(X1)/N,'kx');
        plot(fr,abs(Xr1)/N,'r-');
        title('f=600 modul');
    subplot(4,1,2)
        grid on;
        stem(f,angle(X1));
        plot(fr,angle(Xr1));
        title('f=600 faza');
    subplot(4,1,3)
        grid on;hold on;
        stem(f,abs(X2)/N,'kx');
        plot(fr,abs(Xr2)/N,'r-');
        title('f=666 modul');
    subplot(4,1,4)
        grid on;
        stem(f,angle(X2));
        plot(fr,angle(Xr2));
        title('f=666 faza');

