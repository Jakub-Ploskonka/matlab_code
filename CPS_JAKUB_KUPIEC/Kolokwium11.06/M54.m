%Przekształcenia fir w pasmowo zaporowy
%
%M54
%
%Jakub Kupiec
clc; clear; close all;

fx=5/20;%Środek pasma
fs=1/2;%Częstotliwość próbkowania
R=5;%Rząd
hDP=fir1(R,1/20,hamming(R+1));%Odp impulsowa filtru dolnoprzepustowego
K=R+1;
n=length(hDP);
%Aby stworzyć odp filtru pz należy stworzyć filtr dp i przejść przez filtr pp
hPP=hDP.*2*cos(2*pi*fx/fs*(n-R/2-1/2));%Odp imp filtru pasmowo przepustowego
hPZ=sinc(n-R/2-1/2)-hPP;%Odp imp filtru pasmowo zaporowego

[H1,F1]=freqz(hDP);
[H2,F2]=freqz(hPP);
[H3,F3]=freqz(hPZ);
HDP=My_freqz(hDP);
HPP=My_freqz(hPP);
HPZ=My_freqz(hPZ);

figure(1)
subplot(3,1,1)
    plot(F1,H1);grid on; hold on;
    title('Charakterystyka filtru DP');
subplot(3,1,2)
    plot(F2,H2);grid on; hold on;
    title('Charakterystyka filtru PP');
subplot(3,1,3)
    plot(F3,H3);grid on; hold on;
    title('Charakterystyka filtru PZ');

n=n*1000
f=0:fs/n:fs-fs/n;

figure(2)
    subplot(3,1,1)
    plot(f,HDP);grid on; hold on;
    title('Charakterystyka filtru DP');
subplot(3,1,2)
    plot(f,HPP);grid on; hold on;
    title('Charakterystyka filtru PP');
subplot(3,1,3)
    plot(f,HPZ);grid on; hold on;
    title('Charakterystyka filtru PZ');


%Funkcja obliczająca char f
function H=My_freqz(h)
n=length(h)*1000;
w=linspace(0,pi,n);
H=zeros(1,n);
for i=1:n
z=exp(-j*w);
H(i)=polyval(h,z(i));
end
end




