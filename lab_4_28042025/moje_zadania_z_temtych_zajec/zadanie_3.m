% Autor: Jakub Ploskonka
% 07 04 2025
% zadanie_3
% symetria dft

% do dokończenia

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
% s = sin(2*pi*f0*t);

% probkowanie
x = zeros([1,length(ts)]);
for i=1:length(ts)
    nowe_t = ts(i);
    x(i) = -1/4 + sin(2*pi*f0*nowe_t);
    % x(i) = sin(2*pi*f0*nowe_t);
end

[y,f] = dft(x);
y_ref = fft(x);
% df = fs/N; 

[xa,ta] = idft(y);
xa_ref = ifft(y);

% blad dft 
blad_dft = max(abs(y-y_ref))
%blad idft
blad_idft = max(abs(xa-xa_ref))


figure(1);

subplot(3,2,1);
plot(t,s); hold on;
stem(ts,abs(xa),'b');hold on;
stem(ts,x,'b')
title("Sygnał ciagly oraz sprobkowany");
ylabel("Amplituda");
%stem(ts,abs(xa),'r+');

subplot(3,2,3);
stem(f,abs(y),'b'); hold on;
stem(f,abs(y_ref),'r+'); hold on;
title("DFT i FFT");
xlabel("Czestotliwosc");
ylabel("Amplituda");

subplot(3,2,4)
stem(f,angle(y), 'b'); hold on;
stem(f,angle(y_ref),'r+');
title("DFT i FFT");
xlabel("Czestotliwosc")
ylabel("Faza");

subplot(3,2,5); hold on;
stem(ta,abs(xa),'b');hold on;
stem(ta,abs(xa_ref),'r+');
title("IDFT i IFFT");
xlabel("Czas");
ylabel("Amplituda");

% subplot(3,2,6)
% stem(f,angle(xa), 'b'); hold on;
% stem(f,angle(xa_ref),'r+');
% title("DFT i FFT");
% xlabel("Czestotliwosc")
% ylabel("Faza");
