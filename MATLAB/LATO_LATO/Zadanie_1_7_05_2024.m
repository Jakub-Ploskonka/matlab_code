% Jakub Płoskonka
% Zadanie 1 Splot liniowy oraz kołowy
 clc; clear all;
fs = 100; % czestotliwosc probkowania
to = 0;
N = 100; % ilosc probek
t = linspace(to,(N-1)/fs,N); %czas
K = 51;

% Sygnal x(t) do sprobkowania
x = (t-1)/1.01;
x_prost = xPI(t,1,1.01);

%Sygnal h(t) do sprobkowania
h = (1/20)*sinc((fs/20)*t-1/4);


%Splot liniowy
y = conv(fft(h),fft(x_prost));

% wykresy

figure(1)

subplot(2,1,1)
    plot(t,h); grid on; hold on;
    stem(t,h);

subplot(2,1,2)
    plot(t,x_prost); grid on; hold on;
    stem(t,x_prost);

    figure(2)

    plot(t, y);
    spem(t,y);



  


