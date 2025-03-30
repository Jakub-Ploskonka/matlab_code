clc; clear; close all;

[x,fs]=CPS_LAB_DFT_sygnal(1);
N = length(x);
X = fft(x);
 
f = (0:N-1)*(fs/N);
K = 2^14;
xx = [x(:); zeros(K-N,1)];
XX = fft(xx);
 
fk = 0:fs/K:fs-fs/K;
 
%figure(4)
%stem(f,abs(X)); grid on; hold on;
%plot(fk,abs(XX), 'm');
  
x_hanning = x.*hanning(length(x))';
xx_hanning = [x_hanning(:); zeros(K-N,1)];
X_hanning = fft(xx_hanning);

XWinH=abs(N/sum(x_hanning))/2
 
figure(6)
stem(f,abs(X)); grid on; hold on;
plot(fk,abs(XX), 'm'); hold on;
plot(fk,XWinH*abs(X_hanning), 'b'); hold on;
%plot(fk,XWinB*abs(X_blackman), 'g'); hold on;

