% Autor Jakub Płoskonka
% 13 06 2025
% zadanie projektowanie filtra IIR
% metoda zachowania odpowiedzi impulsowej
% metoda transformacji biliniowej

clc; clear; close all;

%fdp butterworth

% fp - czestotliowsc konca pasma przepustowego
% fr - czestotliowsc poczatku pasma zaporowego  
% Rp - maksymalna dopuszczalna amplituda oscylacji w pasmie przepustowym
% Rr - minimalne wymagane tlumienie w pasmie zaporowym
% fs - czestotliwosc probkowania

fp = 1250;
fr = 1750; 
Rp = 2; 
Rr = 50;
fs = 8000;

% Obliczany jest minimalny rzęd filtru Butterwortha, który spełnia zadane parametry tłumienia i częstotliwości
N = ceil(log10(sqrt(10^(Rr/10)-1) / (sqrt(10^(Rp/10)-1))) / log10(fr/fp));

fi = (fp+fr)/2; % Częstotliwość pośrednia
Ri = (Rp+Rr)/2; % Średnie tłumienie

f0 = fi / (10^(Ri/10)-1)^(1/(2*N)); % Częstotliwość graniczna dla analogu

k = 1:N;

za = []; % Brak zer w filtrze Butterwortha
pa = 2*pi*f0*exp(j*pi*(1/2+(2*k-1)/(2*N))); % Bieguny analogowego filtru
ka = abs(prod(pa)); % Wzmocnienie

[ba, aa] = zp2tf(za,pa,ka); % Postać transmitancyjna
iir_1;

[Ha, Fa] = freqs(ba, aa, 2*pi*linspace(0,fs,5e+3)); % Charakterystyka częstotliwościowa filtru analogowego
iir_2

% Transformacja biliniowa – przekształcenie do postaci cyfrowej  

Ts = 1/fs;

[r,p,K] = residue(ba,aa);

licznik = Ts*r;
mianownik = exp(Ts*p);

[b1,a1] = residue(licznik,mianownik,K);

% Oblicza odpowiedź częstotliwościową filtru cyfrowego
Q = 10000;
[H1, F1] = freqz(b1,a1,Q,fs); % Charakterystyka cyfrowego filtru
iir_3

% Impulsowa odpowiedź filtru
ha = odp_imp_2(ba,aa,50); % Odpowiedź impulsowa filtru analogowego
h1 = odp_imp_2(b1,a1,50); % Odpowiedź impulsowa filtru cyfrowego


figure(5) % Rysowanie odpowiedzi impulsowej
stem(real(h1),'b', LineWidth=2); grid on; hold on;
xlabel('Probka [n]');
title('Odpowiedź impulsowa filtru cyfrowego');

figure(6) % Wykresy zera-biegun
zplane(ba,aa); % Analogowy
grid
figure(7)
zplane(b1,a1); % Cyfrowy
grid

% Sygnał testowy – suma 4 kosinusów o różnych częstotliwościach
K = 50;
f100 = 450;
f200 = 1200;
f300 = 1800;
f400 = 3150; 
Dt = 1/fs;
tx = 0 : Dt : K*Dt-Dt;
xs = cos(2*pi* f100 *tx) + cos(2*pi* f200 *tx) + cos(2*pi* f300 *tx) + cos(2*pi* f400 *tx);

y = conv(xs,h1); % , "same" Sygnał wyjściowy po filtracji

figure(9) % Wykresy sygnałów: wejściowego, odpowiedzi i wyjściowego
subplot(3,1,1);
    stem(xs,"r", LineWidth=2); grid on; hold on;
    title("Wykres sygnału wejściowego x[n]"); % x[n]
    xlabel('Probka [n]'); ylabel('Magnitude');
subplot(3,1,2);
    stem(real(h1),"g", LineWidth=2); grid on; hold on;
    title("Odpowiedź impulsowa filtru h[n]"); % h[n]
    xlabel('Probka [n]');
subplot(3,1,3);
    stem(real(y),"b", LineWidth=2); grid on; hold on;
    title("Sygnał wyjściowy y[n] = x[n] * h[n]"); % y[n]

% Analiza w dziedzinie częstotliwości (FFT)
% Realizuje filtrację w dziedzinie częstotliwości przez mnożenie FFT
Df = fs/K;
f = 0:Df:Df*K-Df;

% Wykresy widm: X, H, Y
H = fft(h1);
X = fft(xs);
Y = X.*H;

figure(10)
subplot(3,1,1); 
    stem(f,abs(X),"r", LineWidth=2); grid on; hold on;
    xlim([0,fs/2]);
    xlabel('Frequency [Hz]'); ylabel('Magnitude');
    title("X – widmo sygnału wejściowego xs");
subplot(3,1,2);
    stem(f,abs(H),"b", LineWidth=2); grid on; hold on;
    xlim([0,fs/2]);
    title("H – widmo filtru cyfrowego h1");
    xlabel('Frequency [Hz]'); ylabel('Magnitude');
subplot(3,1,3);
    stem(f,abs(Y),"blue", LineWidth=2); grid on; hold on;
    xlim([0,fs/2]);
    title("Y – widmo sygnału po filtracji: y = x * h");
    xlabel('Frequency [Hz]'); ylabel('Magnitude');

figure(11) % Porównanie odpowiedzi analogowej i cyfrowej filtru
plot(Fa/(2*pi), 20*log10(abs(Ha)), 'b', LineWidth=2); hold on;
plot(F1, 20*log10(abs(H1)), 'r', LineWidth=2); hold off;
xlim([0, fs/2]);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Ha - analog', 'H1 - cyfra');
title('Porównanie odpowiedzi analogowej i cyfrowej filtru - transmitancja ');
grid on;



% Funkcje

% odp_imp_2
function h = odp_imp_2(b,a,L)

h = zeros(1,L);
B = zeros(1,length(b));
A = zeros(1,length(a)-1);
B(1) = 1;

for n=1:L
   h(n) = sum(b.*B)-sum(a(2:end).*A);
   B = [0,B(1:end-1)];
   A = [h(n),A(1:end-1)];
end
end