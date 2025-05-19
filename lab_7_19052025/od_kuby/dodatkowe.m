close all, clear, clc
N = 100
n = 0:N-1
fs = 45
f1 = 10
f2 = 20
ts = 1/fs * n
x1 = cos(2*pi*f1*ts)
x2 = sin(2*pi*f2*ts)

x3 = x1 + j*x2;


X3 = fft(x3);
X1 = fft(x1);
X2 = fft(x2);
subplot(2,1,1)
hold on, grid on
stem(abs(X3),'bx')
stem(abs(X1),'k')
xlim([0, length(x2)/2])
subplot(2,1,2)
hold on, grid on;
stem(abs(X3),'rx')
stem(abs(X2),'k')
xlim([length(x2)/2,length(x2)])