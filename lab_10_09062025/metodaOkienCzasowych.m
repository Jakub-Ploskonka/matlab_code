% Autor Jakub Ploskonka
% 09 06 2025
% metoda okien czasowych - przyklad z 2024

% Tabela z wartociami:
%   'rectwin';     % prostokątne    21  1.1
%   'bartlett';    % Bartlett’a     26  3.1
%   'hann';        % von Hann’a     44  3.1
%   'hamming';     % Hamming’a      53  3.3
%   'blackman';    % Blackman’a     75  5.6
%   'parzenwin';   % Parzen’a       56  7.0
%   'flattopwin';  % flattop        115 9.7
%   'chebwin';     % Chebyszew      70  4.6

clc; clear; close all;

fp = 1250; 
fr = 1750; 
Rr = 50; 
fs = 8000;
f0 = (fp+fr)/2;

%ponieważ Rr = 50db wybieramy okno z najbliższym większym tłumieniem czyli
%okno Hamminga (Rr = 53) dla którego
a = 3.3;
R = ceil(a*fs/(fr-fp)); %R musi być większą bądź równą liczbą całkowitą dlatego zaokrąglamy w górę
R
K = R+1; % ilosc probek
%df = 1000; 
%f = -2:df:fs/2;
%f_H1s = 0:(fs/R):fs;



%Metoda okien czasowych
n = 0 : R; % wektor probek indeksow czasowych
H1s = 2 * (f0/fs) .* sinc(2 * (f0/fs) * (n - (R/2) )); % impulsowa odpowiedź idealnego filtru dolnoprzepustowego, wyznaczona metodą próbkowania funkcji sinc
H1o = H1s .* hamming(K)'; % odyfikację (przycięcie i wygładzenie) idealnej odpowiedzi impulsowej H1s za pomocą okna


% Wykresy
[H1 F1] = freqz(H1o,1,8000,fs);

fir_1
fir_3


figure(3)
stem(n,H1s, LineWidth=2); grid on; hold on;
title('impulsowa odpowiedź  filtru');
xlabel('probki [n]'); % indeks próbkowania
ylabel('Amplituda h[n]');
legend('h[n], R = 53');


figure(4)
subplot(2,1,1)
    plot(F1,(abs(H1)), 'r', LineWidth=2); grid on; hold on;
    xline(fp, LineWidth=1);
    xline(fr, LineWidth=1);
    xlabel("Frequency (Hz)");
    ylabel("Magnitude");
subplot(2,1,2)
    plot(F1,unwrap(angle(H1)), 'r', LineWidth=2); grid on; hold on;
    xlabel("Frequency (Hz)");
    ylabel("Phase");
% 
% figure(5)
% subplot(2,1,1)
%     plot(F1,20*log10(abs(H1)), 'r', LineWidth=2); grid on; hold on;
%     xline(fp, LineWidth=1);
%     xline(fr, LineWidth=1);
%     xlabel("Frequency (Hz)");
%     ylabel("Magnitude (dB)");
% subplot(2,1,2)
%     plot(F1,unwrap(angle(H1)), 'r', LineWidth=2); grid on; hold on;
%     xline(fp, LineWidth=1);
%     xline(fr, LineWidth=1);
%     xlabel("Frequency (Hz)");
%     ylabel("Phase (dB)");
% 
% %Funkcja wbudowana
% funk_wbudowana = fir1(R,f0/(fs/2),hann(K));
% 
% figure(6)
% freqz(funk_wbudowana,1,8000,fs);
% xline(fp, LineWidth=1);
% xline(fr, LineWidth=1);
