clc; clear; close all;

fp = 1250; fr = 1750; fs = 8000; Rr = 50;
f0 = (fp+fr)/2;

% okno hamminga
a = 3.3;
%a = 5.6;

R = ceil(a*fs/(fr-fp));
K = R+1;

M = 8*K;
L = (M-2)/2;

Df = fs/M;
f = 0:Df:M*Df-Df;

o = floor(f0/Df);

HM = [1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
hx = fftshift(ifft(HM));

%hx = hx(floor(K/2)+1:floor(K/2)+K);
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2));

h = hx(:).*hamming(K);
%h = hx(:).*blackman(K);

n = 0:R;

figure();
    subplot(2,1,1);
    stem(f,HM,"b.");
    title('HM');
    xlabel('f(Hz)');
    ylabel('HM');

subplot(2,1,2);
    stem(h,"r.");
    title('h');
    xlabel('Próbki');
    ylabel('Amplituda');

%fir_1;
[H2, F2] = freqz(h,1,K*200,fs);
%fir_4;

figure();
    stem(f,abs(HM),"kd","fill");
    title('Magnitude of HM');
    xlabel('f[Hz]');
    ylabel('Moduł');

mode = 1;
switch(mode)
    case 1
        fs=8000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
end

y = conv(h,xs);

figure();
subplot(3,1,1);
    stem(xs,"r.");hold on;grid on;
    title("x");
    xlabel('Próbki');
    ylabel('Amplituda');
subplot(3,1,2);
    stem(h,"b.");hold on;grid on;
    title("h");
    xlabel('Próbki');
    ylabel('Amplituda');
subplot(3,1,3);
    stem(y,"g.");hold on;grid on;
    title("y");
    xlabel('Próbki');
    ylabel('Amplituda');


Df = fs/K;
f = 0:Df:Df*K-Df;

H = fft(h);
X = fft(xs);
Y = X(:).*H;

figure();
    subplot(3,1,1);
        stem(f,abs(X),"r.");hold on;grid on;
        xlim([0,fs/2]);
        title("X");
        xlabel('f[Hz]');
        ylabel('Moduł');
    subplot(3,1,2);
        stem(f,abs(H),"b.");;hold on;grid on;
        xlim([0,fs/2]);
        title("H");
        xlabel('f[Hz]');
        ylabel('Moduł');
    subplot(3,1,3);
        stem(f,abs(Y),"g.");hold on;grid on;
        xlim([0,fs/2]);
        title("Y");
        xlabel('f[Hz]');
        ylabel('Moduł');

hGP = sinc(n-R/2-1/2) - h.';

HGP = fft(hGP);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');

    subplot(3,1,2);
        stem(n,hGP,"r.");hold on;grid on;
        title('hGP');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,3);
        stem(f,abs(HGP),"r.");hold on;grid on;
        xlim([0,fs/2])
        title('FGP (Filtr górno przepustowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');

fx = 2000;

hPP = 2*cos(2*pi*fx/fs.*(n-R/2-1/2)).*(h.');
HPP = fft(hPP);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,2);
        stem(n,hPP,"r.");hold on;grid on;
        title('hPP');
        xlabel('Próbki');
        ylabel('Amplituda');;
    subplot(3,1,3);
        stem(f,abs(HPP),"r.");hold on;grid on;
        xlim([0,fs/2])
        title('FPP (Filtr pasmowo przepustowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');

hPZ = sinc(n-R/2-1/2) - hPP;

HPZ = fft(hPZ);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,2);
        stem(n,hPZ,"r.");hold on;grid on;
        title('hPZ');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,3);
        stem(f,abs(HPZ),"r.");hold on;grid on; 
        xlim([0,fs/2])
        title('FPZ (Filtr pasmowo zaporowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');






        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Autor Jakub Ploskonka
% 09 06 2025
% zadanie 2
% metoda okien czasowych + DFT

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

fp = 1350; 
fr = 1650; 
Rr = 47; 
fs = 8000;
f0 = (fp+fr)/2;
fir_1

a = 3.3;
R = ceil(a*fs/(fr-fp)); %R musi być większą bądź równą liczbą całkowitą dlatego zaokrąglamy w górę

K = R+1; % ilosc probek
n = 0 : R; 

% metoda DFT
M = 2* K;


L = (M - 2) / 2;
df = fs/M;
f = 0 : df: M * df - df;

o = floor(f0/df);

fm = fs/M;
Hm = zeros(1,M); 


for m = 1 : M/2
    if (m-1) * fm < f0
        Hm(m) = 1;
        Hm(M-m+1) = 1;
    else 
        Hm(m) = 0;
    end
end


H2s = fftshift(ifft(Hm));

H2o = H2s .* hamming(M)';

[H2 F2]=freqz(H2o, 1,2^10,fs);

fir_4


figure(3)
stem(n,H2s, LineWidth=2); grid on; hold on;
title('impulsowa odpowiedź  filtru');
xlabel('probki [n]'); % indeks próbkowania
ylabel('Amplituda h[n]');
legend('h[n]');


figure(4)
subplot(2,1,1)
    plot(F2,(abs(H2)), 'r', LineWidth=2); grid on; hold on;
    xline(fp, LineWidth=1);
    xline(fr, LineWidth=1);
    xlabel("Frequency (Hz)");
    ylabel("Magnitude");
subplot(2,1,2)
    plot(F2,unwrap(angle(H2)), 'r', LineWidth=2); grid on; hold on;
    xlabel("Frequency (Hz)");
    ylabel("Phase");



%Metoda okien czasowych
n = 0 : R; % wektor probek indeksow czasowych
H1s = 2 * (f0/fs) .* sinc(2 * (f0/fs) * (n - (R/2) )); % impulsowa odpowiedź  filtru dolnoprzepustowego, wyznaczona metodą próbkowania funkcji sinc
H1o = H1s .* hamming(K)'; % odyfikację (przycięcie i wygładzenie) idealnej odpowiedzi impulsowej H1s za pomocą okna


% Wykresy
% [H2 F2] = freqz(H1o,1,2^10,fs);
% fir_4

% figure(3)
% stem(n,H1s, LineWidth=2); grid on; hold on;
% title('impulsowa odpowiedź  filtru');
% xlabel('probki [n]'); % indeks próbkowania
% ylabel('Amplituda h[n]');
% legend('h[n], R = 53');
% 
% 
% figure(4)
% subplot(2,1,1)
%     plot(F1,(abs(H1)), 'r', LineWidth=2); grid on; hold on;
%     xline(fp, LineWidth=1);
%     xline(fr, LineWidth=1);
%     xlabel("Frequency (Hz)");
%     ylabel("Magnitude");
% subplot(2,1,2)
%     plot(F1,unwrap(angle(H1)), 'r', LineWidth=2); grid on; hold on;
%     xlabel("Frequency (Hz)");
%     ylabel("Phase");
