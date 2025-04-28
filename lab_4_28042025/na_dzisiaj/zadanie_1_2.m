clc; clear; close all;

f0 = 100;
dt = 1/(100*f0);
t = 0:dt:(2/f0);

fs = 1000;
T_samp = 1/fs;
ts = 0:T_samp:t(end);
ts = ts(1:end-1); % obciecie ostatniej próbki
N = length(ts);

s = @(t) sin(2*pi*f0*t);
s1 = s(t);

x1 = zeros([1,length(ts)]);

for i=1:length(ts)
    nowe_t = ts(i);
    x1(i) = s(nowe_t);
end

[y1,f] = dft(x1);
f = f * fs/N;

% % f_cft = -fs:0.1:fs;
% for i=1:length(t)
%     y_cft = calka(s1*exp(-2*pi*j*))
% end

figure(1)
subplot(2,2,1)
plot(t,s1); hold on;
stem(ts,x1); hold off;
subplot(2,2,2)
stem(f,abs(y1))
xlim([-fs/2,fs/2])

subplot(2,1,2)
stem(f,abs(y1))