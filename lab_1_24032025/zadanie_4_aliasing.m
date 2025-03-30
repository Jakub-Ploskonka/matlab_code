% zadanie_4_aliasing.m
% Autor: Jakub Ploskonka
% 03 2025
% Zadanie 4
% syg_sin ograniczony oknem prostoktnym + próbkowanie + odtwarzanie z tw. Shannona 
% + aliasing

% Twierdzenie Shannona (Nyquista)
% fs >= 2*fo

% Dane wejsciowe
% k - liczba pelnych okresow symetrycznych wzgledem to = 0
% fo - czestotliwosc syg sinusoidalnego
% fs - czestotliwosc probkowania

% Dane wyjsciowe
% s - wygenerowany sygnal "analogowy"
% x - sygnal cyfrowy "sprobkowany sygnal analogowy s"
% sa - odtworzony sygnal "analogowy" z tw Shanona

% ts = 1/fs     

clc; clear; close all;

% Parametry
k = 3;
fo = 1000; % [Hz]

% SYGNAL ANALOGOWY
dt = 10e-6;
t = -(k+1)/fo : dt : (k+1)/fo;  % k+1 zedy widac bylo okno prostokatne
% (k+1)/fo = 4/1000
s = syg_sin(t,k,fo);

% SYGNAL PROBKOWANY
N = 50;
n = -25 : N-26;
fs = 5000;
ts = n / fs;

x = syg_sin(ts,k,fo);

% SYGNAL ODTWORZONY
s_odtw = zeros(1,length(t));
for i = 1 : N
    s_odtw = s_odtw + x(i) .* sinc(fs * (t - n(i) .* (1/fs)));
end

% ALIASING
% dla f_alias_2000 => n1, fs1, ts1, s_odtw_1   przesunac sin o pi/2
n1 = -25 : N-26;
fs1 = 2000;
ts1 = n1 / fs1;
x1 = syg_sin(ts1,k,fo);
s_odtw_1 = zeros(1, length(t));
for i = 1:N
    s_odtw_1 = s_odtw_1 + x1(i) * sinc(fs1 * (t - n1(i) * (1/fs1)));
end

% dla f_alias_555 => n2, fs2, ts2, s_odtw_2
n2 = -25 : N-26;
fs2 = 555;
ts2 = n2 / fs2;
x2 = syg_sin(ts2,k,fo);
s_odtw_2 = zeros(1, length(t));
for i = 1:N
    s_odtw_2 = s_odtw_2 + x2(i) * sinc(fs2 * (t - n2(i) * (1/fs2)));
end


% Wykresy
figure(1)       % syg analogowy + probkowanie
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
title('Sygnal s(t) oraz sprobkowany sygnal x');
xlabel('t (czas)'); ylabel('Amplituda');

figure(2)       % syg odtworzony + probkowanie
plot(t,s_odtw,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
title('Sygnal s(t) odtworzony z próbek ');
xlabel('t (czas)'); ylabel('Amplituda');

figure(3)       % syg analogowy + probkowanie + syg odtworzony
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts,x, 'r-', LineWidth=2); grid on; hold on;
plot(t,s_odtw,'g-',LineWidth=2); grid on; hold on;
title('Sygnal s(t) oraz sprobkowany sygnal x');
xlabel('t (czas)'); ylabel('Amplituda');
legend('s(t)','x(n)','s_odtw');

figure(4)       % aliasing
subplot(3,1,1)
plot(t,s,'b-',LineWidth=2); grid on; hold on;               %s(t)
stem(ts,x);  % próbki fs1=2000
plot(t,s_odtw,'g-',LineWidth=2);
legend('s(t)','x3000','s_odtw3000');
title('Poprawnie przy fs > 2*fo');

subplot(3,1,2)
plot(t,s,'b-',LineWidth=2); grid on; hold on;               %s(t)
stem(ts1,x1);  % próbki fs1=2000
plot(t,s_odtw_1,'g-',LineWidth=2);
legend('s(t)','x2000','s_odtw2000');
title('Aliasing przy fs = 2*fo');

subplot(3,1,3)
plot(t,s,'b-',LineWidth=2); grid on; hold on;
stem(ts2,x2);  % próbki fs1=555
plot(t,s_odtw_2,'g-',LineWidth=2);
legend('s(t)','x555','s_odtw555');
title('Aliasing przy fs < 2*fo');


% funkcja syg_sin(t,k,fo)
function s = syg_sin(t,k,fo)

s = sin(2 * pi * fo * t);    %+ pi/2);

okno = zeros(1,length(t));
okno(abs(t)<(k/fo))=1;

s = s .* okno;

end