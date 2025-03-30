clear; clc; close all;
 
fs = 3000;
N = 30;
Dt = 1/fs;
T = N*Dt;
t0 = 0; 
 
dt = 0.0001; t = t0-T/3:dt:T+T/3;
f0 = 600;
 
Df = fs/N;
 
ts = t0:Dt:Dt*N-Dt;
 
s = sin(2*pi*f0*t);
xn = sin(2*pi*f0*ts);
Xn = calcDFT(xn);
f= fs*(0:N-1)/N;
 
figure(1); 
subplot(2,1,1); plot(t,s,'b'); hold on; grid on; stem(ts,xn, 'r'); title("f0 = 600"); xlabel("Dziedzina czasu");
subplot(2,1,2);stem(f, abs(Xn)/N); grid on; xlabel("Dziedzina częstotliwości");
 
fs = 3000;
N = 30;
Dt = 1/fs;
T = N*Dt;
t0 = 0;
 
dt = 0.0001; t = t0-T/3:dt:T+T/3;
f0 = 666;
 
Df = fs/N;
 
ts = t0:Dt:Dt*N-Dt;
 
s = sin(2*pi*f0*t);
xn = sin(2*pi*f0*ts);
Xn = calcDFT(xn);
f= fs*(0:N-1)/N;
 
figure(2); 
subplot(2,1,1); plot(t,s,'b'); hold on; grid on; stem(ts,xn, 'r'); title("f0 = 666"); xlabel("Dziedzina czasu");
subplot(2,1,2);stem(f, abs(Xn)/N); grid on; xlabel("Dziedzina częstotliwości");
 
 
 
Df = fs/N;
DfZ = fs/(N+1000);
 
ts = t0:Dt:Dt*N-Dt;
s = sin(2*pi*f0*t);
xn = sin(2*pi*f0*ts);
xnZ = [xn, zeros(1,1000)];
 
M = length(xnZ);
XK = calcDFT(xn);
XKZ = calcDFT(xnZ);
 
f = -fs:1:fs;
f_shiftedZ = -fs/2:DfZ:fs/2-DfZ;
f_shifted = -fs/2+Df/2:Df:fs/2-Df/2;
f_shiftedZw = -fs/2+DfZ/2:DfZ:fs/2-DfZ/2;
 
f_shiftedZn = -fs/2:Df:fs/2-DfZ;
 
f= fs*(0:N-1)/N;
figure(3);
subplot(3,1,1); plot(t,s,'b'); hold on; grid on; stem(ts,xn, 'r'); title("f0 = 666"); xlabel("Sygnał + próbki"); 
subplot(3,1,2);plot(f_shiftedZ, fftshift(abs(XKZ))/N); grid on; hold on; xlabel("Amplituda"); stem(f, abs(Xn)/N);grid on; hold on;
subplot(3,1,3); stem(f_shiftedZ, fftshift(angle(XKZ))/N, ".g"); grid on; xlabel("Faza");
 
 
f= fs*(0:N-1)/N;
figure(4)
plot(f_shiftedZw, abs(XKZ)/N, ".g"); grid on; hold on;
%stem(f_shiftedZn, abs(Xn)/N); grid on; xlabel("Dziedzina częstotliwości");
 
 
fs = 3000;
N = 30;
Dt = 1/fs;
T = N*Dt;
t0 = 0;
 
dt = 0.0001; t = t0-T/3:dt:T+T/3;
f0 = 666;
 
Df = fs/N;
DfZ = fs/(N+1000);
 
ts = t0:Dt:Dt*N-Dt;
 
s = sin(2*pi*f0*t);
xn = sin(2*pi*f0*ts);
xnZ = [xn, zeros(1,1000)];
xnWin = xn .* blackman(N)';
xnWinH = xn .* hamming(N)';
xnZWin = [xnWin, zeros(1, 1000)];
xnZWinH = [xnWinH, zeros(1, 1000)];
 
M = length(xnZ);
 
XK = calcDFT(xn);
XKZ = calcDFT(xnZ);
 
XKWIN = calcDFT(xnWin);
XKZWIN = 2.4633*calcDFT(xnZWin);
XKZWINH = 1.9234*calcDFT(xnZWinH);
 
 
f = -fs:1:fs;
f_shiftedZ = -fs/2:DfZ:fs/2-DfZ;
f_shifted = -fs/2+Df/2:Df:fs/2-Df/2;
f_shiftedZw = -fs/2+DfZ/2:DfZ:fs/2-DfZ/2;
 
figure(5);
subplot(4,1,1); plot(t,s,'b'); hold on; grid on; stem(ts,xn, 'r');
subplot(4,1,2);plot(f_shiftedZ, fftshift(abs(XKZ))/N); grid on;
subplot(4,1,3); stem(f_shiftedZ, fftshift(angle(XKZ))/N, ".g"); grid on;
subplot(4,1,4);plot(f_shiftedZw, fftshift(abs(XKZWIN)/N)); grid on; hold on; plot(f_shiftedZw, fftshift(abs(XKZWINH)/N), 'r'); grid on;
 
figure(6);
plot(f_shiftedZw, fftshift(abs(XKZWIN)/N), 'b'); grid on; hold on; plot(f_shiftedZw, fftshift(abs(XKZWINH)/N), 'r'); grid on; hold on; plot(f_shiftedZ, fftshift(abs(XKZ))/N, 'g'); grid on;