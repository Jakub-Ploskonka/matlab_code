clc; clear; close all;

% Parametry
f0 = 3000;              % Hz
fs = 10000;             % częstotliwość próbkowania
dt = 1/(100*f0);        
t = 0:dt:1e-3;          % czas ciągły
s = 1/4 + sin(2*pi*f0*t);   % sygnał ciągły

% Próbkowanie
N = 10;
T_samp = 1/fs;
ts = 0:T_samp:(N-1)*T_samp;
x = 1/4 + sin(2*pi*f0*ts);   % sygnał dyskretny

% DFT
y = fftshift(fft(x));
N = length(x);
f_dft = (-N/2:N/2-1)*(fs/N);  % oś częstotliwości dla DFT

% CFT
fx = fs;                        % zakres do porównania
[S, f_cft] = widmoCFT(t, s, fx);  % wywołanie funkcji z zadania
S = S / max(abs(S));             % normalizacja amplitudy CFT
y = y / max(abs(y));             % normalizacja amplitudy DFT


% Wykres porównawczy
figure;
plot(f_cft, abs(S), 'LineWidth', 2); hold on;         % widmo CFT
stem(f_dft, abs(y), 'r','LineWidth',1.5);              % widmo DFT
grid on;
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
title('Porównanie: CFT (linia) vs DFT (kropki)');
legend('CFT', 'DFT');



function [S, f] = widmoCFT(t, s, fx)
%####################################################################
%# widmoCFT.m                                                       #
%# Funkcja obliczająca widmo ciągłe CFT                             #
%  
%####################################################################
%# Dane wejściowe:                                                  #
%# t  - czas (wektor)                                               #
%# s  - sygnał ciągły (wektor tej samej długości co t)              #
%# fx - maksymalna częstotliwość: obliczane jest widmo od -fx do fx#
%# Dane wyjściowe:                                                  #
%# S  - widmo CFT                                                   #
%# f  - wektor częstotliwości                                       #
%####################################################################

% Gęstość próbkowania czasu (zakładamy równomierne próbkowanie)
dt = t(2) - t(1);

% Rozdzielczość widma i zakres
N = 1000;                          % liczba punktów widma
f = linspace(-fx, fx, N);          % wektor częstotliwości

% Obliczanie widma
S = zeros(size(f));
for i = 1:length(f)
    S(i) = sum(s .* exp(-1j*2*pi*f(i)*t)) * dt;
end

end


% wnioski
%
%
%
%
%
%
%
%
%
%
%

