% --- Własna implementacja prototypu filtru Czebyszewa I rodzaju

fp = 1250;
fr = 1750; 
Rp = 2; 
Rr = 50;
fs = 8000;

Wp = 2*pi*fp;   % rad/s
Wr = 2*pi*fr;

% Oblicz współczynnik epsilon na podstawie tłumienia w paśmie przepustowym
ep = sqrt(10^(Rp/10) - 1);

% Oblicz rząd filtru (N) – wzór z definicji
N_real = acosh(sqrt((10^(Rr/10) - 1) / (10^(Rp/10) - 1))) / acosh(Wr/Wp);
N = ceil(N_real);  % zaokrąglony rząd filtru

% Oblicz bieguny filtru Czebyszewa I rodzaju
k = 1:N;
beta = asinh(1/ep)/N;

% Prototypowe bieguny (normalizowane, dla omega_c = 1 rad/s)
pk = -sin(pi*(2*k - 1)/(2*N)) * sinh(beta) + 1i * cos(pi*(2*k - 1)/(2*N)) * cosh(beta);

% Skalowanie do częstotliwości granicznej ωp
omega_c = Wp / ( (1/ep)^(1/N) );  % korekta skalowania
pa = omega_c * pk;
za = [];  % brak zer w Czebyszewie I rodzaju
ka = real(prod(-pa));  % wzmocnienie – filtr stabilny

[ba, aa] = zp2tf(za, pa, ka);  % transmitancja filtru analogowego


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





% --- Projektowanie filtru Czebyszewa I rodzaju (analogowego)

% Parametry wejściowe
fp = 1250;       % częstotliwość końca pasma przepustowego [Hz]
fr = 1750;       % częstotliwość początku pasma zaporowego [Hz]
Rp = 2;          % dopuszczalne tłumienie w paśmie przepustowym [dB]
Rr = 50;         % minimalne tłumienie w paśmie zaporowym [dB]
fs = 8000;       % częstotliwość próbkowania [Hz]

Wp = 2*pi*fp;    % zamiana na rad/s
Wr = 2*pi*fr;

% Obliczenie minimalnego rzędu i częstotliwości granicznej filtru
[N, Wn] = cheb1ord(Wp, Wr, Rp, Rr, 's');  % analogowy filtr

% Obliczenie współczynników filtru analogowego
[ba, aa] = cheby1(N, Rp, Wn, 's');  % 's' = analogowy filtr

% Transmitancja
[za, pa, ka] = tf2zp(ba, aa);
