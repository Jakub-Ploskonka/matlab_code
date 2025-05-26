% Autor: Jakub Płoskonka
% 5 05 2025
% Okna + zjawisko przecieku w1 widmie dla sprobkowanego sygnalu analogowego 
% od 0 do fs
% Zadanie 2


clc; close all; clear

%Lab_16_04_Zad2
close all; clc; clear;
f0=666;
N=20;

%Okno

w1 = rectwin(N);
w2 = hamming(N);

%Tworzymy sygnal i przemnazamy przez okno prostokatne
w1 = w1';
ratio = sum(rectwin(N))/sum(w1);
fs = 3000;
ts = 0:1/fs:(N-1)/fs;
x = sin(2*pi*f0*ts).*w1*ratio;

f = 0:fs/N:fs - fs/N;
X = MyDFT(x);


M = 1000;
xr = [x,zeros(1,M)];
Xr = MyDFT(xr);
fr = 0:fs/(N+M):fs - fs/(N+M);

%Tworzymy sygnal i przemnazamy przez okno Hamminga
w2 = w2';
ratio = sum(rectwin(N))/sum(w2);
fs = 3000;
ts = 0:1/fs:(N-1)/fs;
x2 = sin(2*pi*f0*ts).*w2*ratio;

f2 = 0:fs/N:fs - fs/N;
X2 = MyDFT(x);


M = 18534;
xr2 = [x,zeros(1,M)];
Xr2 = MyDFT(xr);
fr2 = 0:fs/(N+M):fs - fs/(N+M);


figure(1)
subplot(2,1,1)
    title('Okno prostokatne');
    grid on;hold on;
    stem(f,abs(X)/N,'kx', LineWidth=2);
    plot(fr,abs(Xr)/N,'b-', LineWidth=2);
    xlabel('Czestotliwosc');
    ylabel('Amplituda');
subplot(2,1,2)
    title('Okno prostokatne');
    grid on; hold on;
    stem(f,angle(X),'kx', LineWidth=2);
    plot(fr,angle(Xr),'g-', LineWidth=2);
    xlabel('Czestotliwosc');
    ylabel('Faza');



%MyDFT
function X=MyDFT(x)
N=length(x);
n=0:N-1;
k=0:N-1;
w1=exp(-1j*2*pi/N);
A=w1.^(k(:)*n);
X=A*x(:);
end

 % case 2
    %     w1 = hann(N);
    % case 3
    %     w1 = blackman(N);
    % case 4
    %     w1 = flattopwin(N);