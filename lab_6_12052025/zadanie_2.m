% Autor: Jakub Płoskonka
% 12 05 2025
% zadanie_2

% Ładuje sygnał z pliku STFT_02.mat
% Porównuje dwie wersje transformacji STFT (krótkoczasowa transformacja Fouriera):
% własnoręcznie napisaną funkcję STFT
% gotową funkcję spectrogram z MATLAB-a
% spektrogramy (obrazy pokazujące zmiany widma w czasie)
clc; clear; close all;

load STFT_02.mat;

nfft = 1000;
frame = 300;
window = hamming(frame)';
overlap = 0; % nakładanie ramek = 0 (brak przesunięcia)
x = x'; % transpozycja sygnału (w razie potrzeby)

[S,f,t] = STFT(x, fs, nfft, window, frame, overlap); % wynik naszego STFT
[spectro, f_spec, t_spec] = spectrogram(x,window,overlap,nfft,fs,'yaxis'); % wynik STFT  matlabowego

figure(1);
    imagesc(t,f,abs(S) / nfft);% wyrysowanie naszego STFT normalizacja przez nfft
    colorbar
    title('Funkcja STFT');
    clim([0 0.08]); % zakres kolorów (jasność amplitudy)
    ylim([0  10e3]); % ograniczenie osi Y do 10 kHz

figure(2);
    imagesc(t_spec, f_spec, abs(spectro)/nfft);
    colorbar
    title('Funkcja spectrogram');
    clim([0 0.08]);
    ylim([0  10e3]);


% Funkcja STFT
% Własna wersja STFT –  dzielenie sygnału na ramki, mnożenie przez okno, wykonanie FFT i zapis wyników

function [S,f,t] = STFT(x,fs,nfft,window,frame,overlap) 
% frame - długość ramek, 
% nfft - ilość elementów fft

x = [x,zeros(1,mod(length(x),(frame-overlap)))]; % zapewniamy sobie że x ma długość wielokrotności frame, aby można było policzyć każdą ramkę

f = 0:fs/nfft:fs - fs/nfft;

S = zeros(length(f),1);

for i = round(1 : length(x)/(frame-overlap) : length(x)) % krok co jaki będziemy brać xsy
    xframe = x(i:min(i+frame-1,length(x))); % bierzemy xsy do ramki dla której będziemy liczyć fft, min zabezpieczenie żeby nie wyjść poza zakres
    xframe = xframe .* window; % przemnażamy go przez okno
    xframe = [xframe,zeros(1,nfft-length(xframe))]; % rozszerzamy o zera aby się zgadzało z nfft
    Xframe = fft(xframe); % obliczamy fft ramki
    S(: , end + 1) = Xframe; % dodajemy do naszego wyniku
end

S = S(: , 1 : end);
t = (0 : size(S,2)-1) * 2 * frame/fs; % obliczenie czasu
end