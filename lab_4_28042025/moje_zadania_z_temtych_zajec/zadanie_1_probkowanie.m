% 

clc; clear; close all;

f0 = 3600;
dt = 1/(100*f0);
t = 0:dt:1e-3;
N = 10;

fs = 9000;
T_samp = 1/fs;
ts = 0:T_samp:(N-1)*T_samp;

%sygnal sinus
s = -1/4 + sin(2*pi*f0*t);

% probkowanie
x = zeros([1,length(ts)]);
for i=1:length(ts)
    nowe_t = ts(i);
    x(i) = -1/4 + sin(2*pi*f0*nowe_t);
end

[y,f] = dft(x);
y_ref = fft(x);

[xa,ta] = idft(y);
xa_ref = ifft(y);

% blad dft 
blad_dft = max(abs(y-y_ref))
%blad idft
blad_idft = max(abs(xa-xa_ref))


figure(1);

subplot(2,1,1);
plot(t,s); hold on;
stem(ts,x,'b')
title("Sygnał ciagly oraz sprobkowany");
xlabel("Czas")
ylabel("Amplituda");

subplot(2,1,2);
stem(ts,abs(xa),'r+'); grid on; hold on;

