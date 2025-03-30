clc; clear; close all;
%Okna Hanninga i blackmana
fs = 3000;
Dt = 1/fs;
 
N = 30;
ts = 0:Dt:(N-1)*Dt;
 
dt = 0.000001;
t = 0:dt:(N-1)*Dt;
k=1:N/2;
 
f0 = 600;
s = 1/4 - sin(2*pi*f0*t);
x = 1/4 - sin(2*pi*f0*ts);
 
X = fft(x);
 
f = (0:N-1)*(fs/N);
 
xr = 0;
for n=1:N
    xr=xr+x(n).*sinc(fs*(t-ts(n)));
end
 
figure(1);
subplot(3,1,1);
plot(t,s); grid on;
 
subplot(3,1,2);
stem(f,abs(X)); grid on;
 
subplot(3,1,3);
stem(f, angle(X)/pi); grid on;
 
figure(2)
plot(t,xr);
 
K = 2^14;
xx = [x(:); zeros(K-N,1)];
XX = fft(xx);
 
fk = 0:fs/K:fs-fs/K;
 
figure(3);
subplot(3,1,1);
plot(t,s); grid on;
 
subplot(3,1,2);
stem(f,abs(X)); grid on;
subplot(3,1,3);
stem(f, angle(X)/pi); grid on;
 
figure(4)
stem(f,abs(X)); grid on; hold on;
plot(fk,abs(XX), 'm');
  
x_hanning = x.*hanning(length(x))';
xx_hanning = [x_hanning(:); zeros(K-N,1)];
X_hanning = fft(xx_hanning);

XWinH=abs(N/sum(x_hanning))/4

x_blackman = x.*blackman(length(x))';
xx_blackman = [x_blackman(:); zeros(K-N,1)];
X_blackman = fft(xx_blackman);

XWinB=abs(N/sum(x_blackman))/4
 
figure(6)
stem(f,abs(X)); grid on; hold on;
plot(fk,abs(XX), 'm'); hold on;
plot(fk,XWinH*abs(X_hanning), 'b'); hold on;
plot(fk,XWinB*abs(X_blackman), 'g'); hold on;