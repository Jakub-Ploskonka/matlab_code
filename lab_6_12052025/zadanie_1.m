% Autor: Jakub Płoskonka
% 12 05 2025
% zadnaie 1
% Okreslenie czestotliwosci wystepujacych w sygnale oraz okreslenie jego
% amplitudy

close all; clc; clear;

nazwa_okna = ["Prostokotne", "Bartletta", "Hanna", "Hamminga", "Blackman", "Flat Top"];

for okno = 0:5
% xs - próbki sygnału
% fs - czest. probkowania

    [xs,fs] = CPS_LAB06_sygnal(2);
    N = length(xs);
    naz = nazwa_okna(okno+1);

    switch okno
        case 0
            w = rectwin(N);
        case 1
            w = bartlett(N);
        case 2
            w = hann(N);
        case 3
            w = hamming(N);
        case 4
            w = blackman(N);
        case 5
            w = flattopwin(N);
    end
    
    % wspKomAmpl - współczynnik normalizacyjny, który kompensuje spadek
    % amplitudy spowodowany zastosowaniem danego okna = > wszystkie sygnały będą miały porównywalną energię 
    w = w';
    wspKomAmpl = sum(rectwin(N))/sum(w);
    disp("Współczynik dla okna " + naz + ": " + wspKomAmpl);
    to = 0;
    
    ts = to : 1/fs : (N-1)/fs + to;
    
    xs = xs .* w * wspKomAmpl;
    
    f = 0:fs/N:fs - fs/N;

    XS = fft(xs).';
    
    % sygnal dopelniany zeriami => wyzsza rozdzielczosc czestotliowsciowa
    M = 4000;
    xsr = [xs,zeros(1,M)]; % zwieksza liczbe punktów FFT
    XSr = fft(xsr);
    fr = 0 : fs/(N+M) : fs - fs/(N+M);
    
    
    %sygnal analogowy
    dt = 0.00001;
    ta = to : dt : to + N/fs;
    xa = zeros(size(ta));
    for i = 1 : N
        xa = xa + xs(i) * sinc((ta-i * 1/fs) * fs);
    end

    fa = -fs/2 : 0.1 : fs/2;
    XA = zeros(size(fa));

    figure(okno + 1) 
        plot(fr, abs(XSr) / N, LineWidth=2); grid on;
        title(naz);
        xlim([0 300]);
end
        

