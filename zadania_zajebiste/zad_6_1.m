clc; clear; close all;

fs=3000;
Dt=1/fs;

N=30;
dt=10e-5;
ts=0:Dt:(N-1)*Dt;
t=0:dt:(N-1)*Dt;

f0=666;

s=sin(2*pi*f0*t);
x=sin(2*pi*f0*ts);

X=fft(x)/N;

f=(0:N-1)*(fs/N);

figure(1);
subplot(3,1,1);
plot(t,s); grid on;
subplot(3,1,2);
stem(f,abs(X));
subplot(3,1,3);
stem(f, angle(X))

K=2^16;
xx=[x(:); zeros(K-N,1)];
XX=fft(xx)/N;

fk=0:fs/K:fs-fs/K;

x_hamming=x.*hamming(N);
X_hamming=fft(x_hamming);

figure(3);
subplot(2,1,1)
stem(f,abs(X)); grid on; hold on;
plot(fk, abs(XX), "m");
plot(f, abs(X_hamming), 'b');
subplot(2,1,2)
stem(f,angle(X)/pi); grid on; hold on;
%plot(fk, pow2db(abs(XX)));
plot(fk, angle(XX)/pi)

