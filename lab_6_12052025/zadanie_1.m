% zadanie_1_1_mozeByc takie
close all; clc; clear;

[x,fs]=CPS_LAB06_sygnal(1);
N = length(x);
X = MyDFT(x);
k = 0 : N-1;
fk = k * (fs/N);

% ratio - współczynnik normalizacyjny, kompensuje spadek
% amplitudy spowodowany zastosowaniem danego okna

w1 = rectwin(N);
w1 = w1';
ratio = sum(rectwin(N)) / sum(w1);
xs1 = x .* w1 * ratio;
XS1 = fft(xs1);

w2 = hamming(N);
w2 = w2';
ratio = sum(rectwin(N))/sum(w2);
xs2 = x .* w2 * ratio;
XS2 = fft(xs2);

%M = 10000;
M = 130000;
xsr = [x,zeros(1,M)];
XSr = fft(xsr);
fr = 0 : fs/(N+M) : fs - fs/(N+M);

xsr1 = [xs1,zeros(1,M)];
XSr1 = fft(xsr1);

xsr2 = [xs2,zeros(1,M)];
XSr2 = fft(xsr2);



% --- ANALIZA widma: wykrywanie częstotliwości obecnych w sygnale ---
% Użyjemy widma z dopełnieniem zerami dla większej dokładności:
widmo = abs(XSr1)/N; % amplituda
threshold = 0.1 * max(widmo); % próg (% maksymalnej wartości)

% Znajdź lokalne maksima powyżej progu
[pks, locs] = findpeaks(widmo, 'MinPeakHeight', threshold);

fprintf('\nWykryte częstotliwości w sygnale (powyżej %.1f%% amplitudy maks):\n', threshold*10);
fprintf('Nr | Częstotliwość [Hz] | Amplituda\n');
fprintf('---+----------------------+----------\n');
for i = 1 : length(locs)
fprintf('%2d | %20.2f | %8.2f\n', i, fr(locs(i)), 2 * pks(i));
end
% dla syg rzeczywistego amp 2 * wart(X) / N



figure(1)
subplot(3,1,1)
    grid on;hold on;
    stem(fk,abs(X)/N,'kx');
    plot(fr,abs(XSr)/N);
    title('DFT');
    xlim([0 250]);
subplot(3,1,2)
    grid on;hold on;
    stem(fk,abs(XS1)/N,'kx');
    plot(fr,abs(XSr1)/N);
    title('DFT - okno prostokatne');
    xlim([0 250]);
subplot(3,1,3)
    grid on;hold on;
    stem(fk,abs(XS2)/N,'kx');
    xlim([0 250]);
    plot(fr,abs(XSr2)/N);
    title('DFT + okno Hamminga');

    figure(2)
        plot(x);
        title('Wykres sygnalu')
        xlabel('Czestotliwosc [Hz]');
        ylabel('Amplituda');

    figure(3)
        grid on;hold on;
        plot(fr,log(abs(XSr)/N));
        title('DFT - skala logarytmiczna');
        xlabel('Czestotliwosc [Hz]');
        ylabel('Amplituda');
        xlim([0 250]);


%MyDFT
function X=MyDFT(x)
N=length(x);
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
X=A*x(:);
end

