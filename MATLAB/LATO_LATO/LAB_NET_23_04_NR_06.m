


clear all; close all; clc
 
fpr_cont=10e3; dt_cont=1/fpr_cont;      % wysoka częstotliwość próbkowania
to_cont=1; N_cont=to_cont/dt_cont;      % czas obserwacji sygnałów
t_cont=(0:N_cont-1)*dt_cont;            % wektor czasu "ciągłego"
 
A1_cont = 1;                    % Amplitudy harmonicznych
A2_cont = 0.5;
 
f1_cont=5; fi1_cont=0;          % częstotliwości i fazy harmonicznych "ciągłych"
f2_cont=15.5; fi2_cont=0; 
 
x1_cont = A1_cont*sin(2*pi*f1_cont*t_cont+fi1_cont);    % generacja sygnałów "ciągłych"
x2_cont = A2_cont*sin(2*pi*f2_cont*t_cont+fi2_cont);
x_cont = x1_cont + x2_cont;
 
%% Generacja sygnałów dyskretnych (próbkowanie)
fpr=50; dt=1/fpr;       % Częstotliwość i okres próbkowania
t0=1; N=t0/dt;          % Czas obserwacji sygnałów i liczba próbek
t=(0:N-1)*dt;           % Wektor czasu
df=fpr/N; F=df*(0:N-1); % Wektor częstotliwości do FFT
 
% Parametry sygnałów dyskretnych oczywiście takie jak ciągłych
A1 = A1_cont;
A2 = A2_cont;
 
f1=f1_cont; fi1=fi1_cont;
f2=f2_cont; fi2 = fi2_cont;
 
% Generacja sygnałów dyskretnych
x1 = A1*sin(2*pi*f1*t+fi1);
x2 = A2*sin(2*pi*f2*t+fi2);
x = x1 + x2;
 
%% Rysunki
figure; 
plot(t_cont, x_cont)
hold on; plot(t, x, 'ob'); grid on;
title(['Sygnał o składowych: ' num2str(f1) ' oraz ' num2str(f2) ' [Hz]']); 
xlabel('Czas [s]'); ylabel('Amplituda [-]')
set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);
 
%% Prawdziwe widmo
figure; 
stem([f1_cont, f2_cont], [A1_cont, A2_cont]);
title(['Widmo sygnału ciągłego o składowych ' num2str(f1_cont) 'Hz oraz ' num2str(f2_cont) 'Hz'])
xlabel('Częstotliwość [Hz]'); ylabel('Amplituda [-]');
axis([0 50 0 1.5]); grid on;
set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);
 
%% Obliczanie DFT z wykorzystaniem algorytmu FFT i rysunki
X = (2/N)*abs(fft(x)); 
 
figure;
stem(F(1:N/2), X(1:N/2)); 
 
grid on;
title(['Widmo sygnału dyskretnego o składowych ' num2str(f1) 'Hz oraz ' num2str(f2) 'Hz'])
xlabel('Częstotliwość [Hz]'); ylabel('Amplituda [-]');
set(findobj(gcf,'type','axes'),'FontName','Halvetica','FontSize',12);