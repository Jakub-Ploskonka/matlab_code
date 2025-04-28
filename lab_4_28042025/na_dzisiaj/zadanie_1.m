clc; clear; close all;

f0 = 1e4;
dt = 1/(100*f0);
t = 0:dt:1e-3;
N = 1001;

fs = 1e6;
T_samp = 1/fs;
ts = 0:T_samp:(N-1)*T_samp;

s1 = sinc(2*f0*t);

x1 = zeros([1,length(ts)]);
% x2 = zeros([1,length(ts)]);

for i=1:length(ts)
    nowe_t = ts(i);
    x1(i) = sinc(2*f0*nowe_t);
%     x2(i) = 1/4 + sin(2*pi*f0*(nowe_t-przesun));
end

[y1,f] = dft(x1);
f = f * fs/N;

% % f_cft = -fs:0.1:fs;
% for i=1:length(t)
%     y_cft = calka(s1*exp(-2*pi*j*))
% end

figure(1)
subplot(2,2,1)
plot(t,s1)
subplot(2,2,2)
stem(f,abs(y1))
xlim([-fs/2,fs/2])

subplot(2,1,2)
stem(f,abs(y1))