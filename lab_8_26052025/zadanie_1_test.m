% Autor Jakub Płoskonka
% 26 05 2025
% zadanie 1 splot liniowy i kolowy
% zadanie 2 odpowiedz impulsowa
% zadanie 3 charakterystyka czestotliwosciowa

clc; clear; close all;
% Zadanie 1
syg = 2;
switch syg
    case 0
        N = 200;
        n = 0:N-1;
        fs = 100;
        ts = n/fs;
        x = xpi((ts-1)/1.01);   % sygnał wejściowy x(t)
        K = 51;
        k = 0:K-1;
        ts1 = k/fs; 
        h = 1/20 * sinc(fs/20 * (ts1-0.25));    % funkcja sinc symulująca filtr
    case 1
        N = 200;
        n = 0:N-1;
        fs = 100;
        ts = n/fs;
        x = xpi((ts-1)/1.01);
        K = 51;
        k = 0:K-1;
        ts1 = k/fs;
        h= 1/5 * sinc(fs/5 * (ts1-0.25));
    case 2
        N = 400;
        n = 0:N-1;
        fs = 100;
        ts = n/fs;
        x = xpi((ts-2)/3) .* (sin(2*pi*3*ts) + sin(2*pi*43*ts));
        K = 51;
        k = 0:K-1;
        ts1 = k/fs;
        h = 1/5 * sinc(fs/5 * (ts1-0.25));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Obliczenie splotu liniowego jako referencji
ylin = conv(h, x);  % referencyjny splot liniowy
Lref = length(ylin);

% 1. M = N
M1 = N;
ykol1 = ifft(fft(x, M1) .* fft(h, M1));
ykol1 = real(ykol1);  % usunięcie części urojonej
ykol1 = ykol1(1:min(length(ykol1), Lref));
err1 = norm(ylin(1:length(ykol1)) - ykol1);

% 2. M = N + K - 1
M2 = N + K - 1;
ykol2 = ifft(fft(x, M2) .* fft(h, M2));
ykol2 = real(ykol2);
ykol2 = ykol2(1:Lref);
err2 = norm(ylin - ykol2);

% 3. M = N + K + 123
M3 = N + K + 123;
ykol3 = ifft(fft(x, M3) .* fft(h, M3));
ykol3 = real(ykol3);
ykol3 = ykol3(1:Lref);  % obcięcie do długości referencyjnej
err3 = norm(ylin - ykol3);

% Wyświetlenie błędów
fprintf('\nBłędy między splotem liniowym a kołowym:\n');
fprintf('M = N             → błąd = %.17f\n', err1);
fprintf('M = N + K - 1     → błąd = %.17f (idealny przypadek)\n', err2);
fprintf('M = N + K + 123     → błąd = %.17f\n', err3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%M = N;
M = N + K-1;
%M = N + K + 1; % M >= N + K
m = 0 : M-1;
ts2 = m/fs;

%Liniowy
y = conv(h,x);
y1 = My_Conv(h,x);
%y1_dostosowane = [y1, zeros(1, M - length(y1))];


%Kołowy
X = fft(x,M);
H = fft(h,M);
ykol = ifft(X .* H);




figure(1)
    subplot(4,1,1)
        plot(ts,x);
        grid on; hold on;
        title('x(t) – sygnał wejściowy');
        xlabel('Czas [s]');
    subplot(4,1,2)
        plot(ts1,h);
        grid on; hold on;
        title('h(t) – odpowiedź impulsowa (filtr)');
        xlabel('Czas [s]');
    subplot(4,1,3)
        %plot(ts2, y1_dostosowane);
        plot(ts2, y1);
        grid on; hold on;
        title('y(t) – wynik splotu liniowego');
        xlabel('Czas [s]');
    subplot(4,1,4)
        plot(ts2,ykol);
        grid on; hold on;
        title('ykol(t) – wynik splotu kołowego');
        xlabel('Czas [s]');


% Zadanie 2 – Odpowiedź impulsowa systemu
zp = 30;
hx = [h, zeros(1,zp)];
odp_imp = My_odp_imp(hx,zp);
odp_imp1 = impz(hx);
Dt = 1/fs;
tl = 0 : Dt : Dt*length(odp_imp)-Dt;

figure(2)
    subplot(2,1,1)
        plot(tl,odp_imp);
        grid on; hold on;
        title('Odp impulsowa');
        xlabel('Czas [s]');
    subplot(2,1,2)
        plot(tl,odp_imp1);
        grid on; hold on;
        title('Wbudowana odp impulsowa');
        xlabel('Czas [s]');


% Zadanie 3 – Charakterystyka częstotliwościowa
Hcz = fft(h);
df = fs/K;
f = 0 : df : df*K-df;

figure(3);
    subplot(2,1,1);
        stem(f, abs(Hcz)); hold on; grid on;
        %xlim([0,length(f)]);
        title("Moduł (abs(Hcz))");
        xlabel('Czestotliwosc [Hz]');
    subplot(2,1,2);
        stem(f, angle(Hcz)/pi); hold on; grid on;
        %xlim([0,length(f)]);
        title("Faza (angle(Hcz)/pi – w jednostkach π)");
        xlabel('Czestotliwosc [Hz]');



% Funkcje
% xpi
function y = xpi(x)
y = zeros(size(x));
y(abs(x)<1/2)=1;
y(abs(x)==1/2)=1/2;
end

%My_Conv
% h - impulsowa odpowiedź systemu (np. filtr)
% x – sygnał wejściowy
% splotLiniowy – wynik splotu liniowego sygnałów h i x
function splotLiniowy = My_Conv(h,x)

% Obliczenie długości
M = length(h);
N = length(x);
K = N + M - 1;

splotLiniowy = zeros(1,K);
hk = [h,zeros(1,N-1)];
xk = [x,zeros(1,M-1)];

% Petla wykonujaca splot
for m = 1:K
       splotLiniowy = splotLiniowy + xk(m) * hk;
       hk = [0,hk(1:end-1)];
end
end

% My_odp_imp
function y = My_odp_imp(h,L)

if (L < length(h))
    L = length(h);
end
y = zeros(1,L);                     % wynik
hk = [h, zeros(1, L-length(h))];    % odpowiedź impulsowa rozszerzona zerami
x = [1, zeros(1, L-1)];              % impuls jednostkowy

for m=1:L
   y = y + hk(m) * x;
   x = [0, x(1:end-1)];
end
end


