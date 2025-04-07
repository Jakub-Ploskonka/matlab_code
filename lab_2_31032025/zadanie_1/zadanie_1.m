% zadanie_1.m
% zadanie_1
% Autor: Jakub Płoskonka
% 31 03 2025
% kryterium bledu (np odleglosc miedzy sygnalami)
% wykres bledu zalezny od czestotliwosci probkowania
% 150 do 9000 Hz probkowania
%

clc; clear; close all;

k = 3;
f0 = 1000;
fs_list = [870, 1300, 3000, 6000, 9000];
% blad_metryka = zeros(size(fs_list));
% metryka liczona tymi funkcjami to jest równa rms (po normalizacji)

blad_rms = zeros(size(fs_list));
blad_avg = zeros(size(fs_list));
fs_count = length(fs_list);

figure(1)

for i = 1:fs_count
    fs = fs_list(i);
    [t,s,ts,x,sa] = syg_sin(k,f0,fs);
    dt = t(2)-t(1);
% blad_metryka(i) = metryka(s,sa,dt);
    blad_rms(i) = rms(s-sa);
    blad_avg(i) = mean(abs(s-sa));

    subplot(fs_count,1,i)
    plot(t,s); hold on;
    plot(t,sa);
    stem(ts,x)
end

figure(2)

stem(blad_avg, 'b-'); hold on; grid on
stem(blad_rms, 'r-');
title('Wykres bledu  ');
xlabel('czestotliwosc (150, 2000, 3000, 6000, 9000)'); ylabel('wartosc bledu');
legend('blad avg (blad bezwzgledny)','blad rms(sredniokwadratowy)');