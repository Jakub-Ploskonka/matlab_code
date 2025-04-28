clc; clear; close all;
load STFT_02.mat;
nfft = 1000;
frame = 300;
window = hamming(frame)';
overlap = 0;
x = x';

[S,f,t] = STFT(x,fs,nfft,window,frame,overlap);%wynik naszego STFT
[spectro, f_spec, t_spec] = spectrogram(x,window,overlap,nfft,fs,'yaxis');%wynik STFT z matlaba

figure(1);
    imagesc(t,f,abs(S)/nfft);% wyrysowanie naszego STFT unormowanego
    colorbar
    title('Funkcja STFT');
    clim([0 0.08]);
    ylim([0  10e3]);

figure(2);
    imagesc(t_spec, f_spec, abs(spectro)/nfft);
    colorbar
    title('Funkcja spectrogram');
    clim([0 0.08]);
    ylim([0  10e3]);