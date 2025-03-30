%
%
%
%
%
clc; clear; close all;

N = 200;
to = 0;

fs1 = 8000;
fs2 = 16000;
fs3 = 4000;

ts1 = 0 : 1/fs1 : N/fs1;
ts2 = 0 : 1/fs2 : N/fs2;
ts3 = 0 : 1/fs3 : N/fs3;

x1 = sin(2*pi*450*ts1) + sin(2*pi*1200*ts1) + sin(2*pi*1800*ts1) + sin(2*pi*3150*ts1);
x2 = sin(2*pi*450*ts2) + sin(2*pi*1200*ts2) + sin(2*pi*1800*ts2) + sin(2*pi*3150*ts2);
x3 = sin(2*pi*450*ts3) + sin(2*pi*1200*ts3) + sin(2*pi*1800*ts3) + sin(2*pi*3150*ts3);
x4 = sin(2*pi*450*ts1) + sin(2*pi*1200*ts1);


fp = 1250;
fr = 1750;
fs = [fs1, fs2, fs3];
Rr = 40;

a = 3.1;

R = ceil(a*fs/(fr-fp)); % -> ceil zaokrągla w górę
K = R+1;

f0 = (fp+fr)/2;

%Metoda okien czasowych
n1 = 0:R(1);
n2 = 0:R(2);
n3 = 0:R(3);

h1s = 2*f0/fs(1) .*sinc(2*f0/fs(1)*(n1-(R(1)/2))); % h1s -> h1 spróbkowane
h1 = h1s.*hanning(K(1))';

h2s = 2*f0/fs(2) .*sinc(2*f0/fs(2)*(n2-(R(2)/2))); % h1s -> h1 spróbkowane
h2 = h2s.*hanning(K(2))';

h3s = 2*f0/fs(3) .*sinc(2*f0/fs(3)*(n3-(R(3)/2))); % h1s -> h1 spróbkowane
h3 = h3s.*hanning(K(3))';

M1 = length(h1);
M2 = length(h2);
M3 = length(h3);

y1 = conv(x1, h1);
y2 = conv(x2, h2);
y3 = conv(x3, h3);

ty1 = 0 : 1/fs1 : (N + M1 - 1)/fs1;
ty2 = 0 : 1/fs2 : (N + M2 - 1)/fs2;
ty3 = 0 : 1/fs3 : (N + M3 - 1)/fs3;

figure(1);
    subplot(3,1,1);
        plot(ts1, x1, 'r.-'); grid on;
        title("Sygnał x1[n]");
        xlabel("n");
        ylabel("x1[n]");
    subplot(3,1,2);
        plot(ts2, x2, 'g.-'); grid on;
        title("Sygnał x2[n]");
        xlabel("n");
        ylabel("x2[n]");
    subplot(3,1,3);
        plot(ts3, x3, 'b.-'); grid on;
        title("Sygnał x3[n]");
        xlabel("n");
        ylabel("x3[n]");

figure(2);
    subplot(3,1,1);
        plot(ty1, y1, 'r.-'); grid on;
        title("Sygnał x1[n] po filtracji");
        xlabel("n");
        ylabel("x1[n]");
    subplot(3,1,2);
        plot(ty2, y2, 'g.-'); grid on;
        title("Sygnał x1[n] po filtracji");
        xlabel("n");
        ylabel("x1[n]");
    subplot(3,1,3);
        plot(ty3, y3, 'b.-'); grid on;
        title("Sygnał x1[n] po filtracji");
        xlabel("n");
        ylabel("x1[n]");

 % 
 % figure(3);
 %    subplot(2,1,1);
 %        plot(ty1, y1, 'r.-'); grid on;
 %    subplot(2,1,2);
 %        plot(ts1, x4, 'b.-'); grid on;
    