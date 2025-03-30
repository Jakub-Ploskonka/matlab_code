clc;
clear;
close all;

f0 = 600; 
f0_2= 666;
fs = 3000;

N = 30;
n = 0:N-1;
to = 0;
ts = to + n/fs;

T = N/fs;
t = linspace(to,to+T,1e3+1);
t = t(1:end-1);
df=fs/N; F=df*(0:N-1); % Wektor częstotliwości do FFT

% sygnał dla fo = 600 Hz
sygnal_analogowy = sin(2*pi*f0*t);
sygnal_probkowany = sin(2*pi*f0*ts);

% sygnał dla fo = 666 Hz
sygnal_analogowy_2 = sin(2*pi*f0_2*t);
sygnal_probkowany_2 = sin(2*pi*f0_2*ts);

% DFT dla 600 Hz
X = (2/N)*abs(fft(sygnal_probkowany));
faza = (2/N)*angle(fft(sygnal_probkowany));

% DFT dla 666 Hz
X_2 = (2/N)*abs(fft(sygnal_probkowany_2));

% WYKRESY

figure(1)

subplot(2,1,1)
    plot(t, sygnal_analogowy,'r-'); grid on; hold on;
    stem(ts, sygnal_probkowany, 'bo','fill');
    title("Próbkowanie dla częstotliwości fo= 600Hz");
    xlabel('Czas [s]'); ylabel('Amplituda [-]')
    set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);

 subplot(2,1,2)
    stem(F(1:N/2), X(1:N/2));  grid on;
    title('Widmo sygnału dyskretnego dla 600 Hz');
    xlabel('Częstotliwość [Hz]'); ylabel('Amplituda [-]');
    set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);
 

figure(2)

subplot(2,2,1)
    plot(t, sygnal_analogowy_2,'r-'); grid on; hold on;
    stem(ts, sygnal_probkowany_2, 'bo','fill'); grid on; hold on;
    title("Próbkowanie dla częstotliwości fo= 666Hz");
    xlabel('Czas [s]'); ylabel('Amplituda [-]')
    set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);

subplot(2,2,2)
    stem(F(1:N/2), X_2(1:N/2)); grid on;
    title('Widmo sygnału dyskretnego dla 666 Hz');
    xlabel('Częstotliwość [Hz]'); ylabel('Amplituda [-]');
    set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);
    
subplot(2,2,4)    
    stem(F(1:N/2), faza(1:N/2));
     title('Faza sygnału dyskretnego dla 666 Hz');
    xlabel('Częstotliwość [Hz]'); ylabel('Amplituda [-]');
    set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);


