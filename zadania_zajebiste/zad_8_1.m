clc; clear; close all;
[x,fs]=audioread('czerwienszy_02_32_k.wav');

X=fft(x);

figure(1)
plot(x);

N = length(x);
L = 500;
overlap=100;

modulo=mod(N,L-2);
z_amount=L-modulo;

x=[x(:);zeros(z_amount,1)];

N = length(x);
Q = N/(L-overlap);
a=L-overlap;
for q = 1:Q-1
    y(q,:)=x((q-1)*a+1:(q-1)*a+L);
end

WH=L/sum(hanning(L))
for q = 1:Q-1
    y_windowed(q,:)=y(q,:).*hanning(L)';
end

for q = 1:Q-1
    y_DFT(q,:)=fft(y_windowed(q,:))*WH;
end

Y=[y_DFT.'];

figure(2)
imagesc(abs(Y));
set(gca, 'YTick')
set(gca, 'YDir', 'normal')
colorbar;
