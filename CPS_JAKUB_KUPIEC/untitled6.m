%Lab_23_04_Zad2
clc; clear; close all;
load STFT_02.mat;
nfft = 1000;
frame = 300;
window = hamming(frame)';
overlap = 0;
x = x';

[S,f,t] = MySTFT(x,fs,nfft,window,frame,overlap);

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


function [S,f,t] = MySTFT(x,fs,nfft,window,frame,overlap);%frame długość ramek, nfft ilość elementów fft

x = [x,zeros(1,mod(length(x),(frame-overlap)))];%zapewniamy sobie że x ma długość wielokrotności frame, aby można było policzyć każdą ramkę

f = 0:fs/nfft:fs - fs/nfft;

S = zeros(length(f),1);

for i = 1:(frame-overlap):length(x)%krok co jaki będziemy brać xsy
    xframe = x(i:min(i+frame-1,length(x)));%bierzemy xsy do ramki dla której będziemy liczyć fft, min zabezpieczenie żeby nie wyjść poza zakres
    xframe = xframe.*window;%przemnażamy go przez okno
    xframe = [xframe,zeros(1,nfft-length(xframe))];%rozszerzamy o zera aby się zgadzało z nfft
    Xframe = fft(xframe);%obliczamy fft ramki
    S(:,end+1) = Xframe;%dodajemy do naszego wyniku
end

S = S(:,1:end);
t = 0:fs/size(S,2):length(x)/fs-fs/size(S,2);  %(0:size(S,2)-1)*2*frame/fs;%obliczenie czasu
end