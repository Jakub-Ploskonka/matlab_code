%Lab_30_04_Zad1
clear; close all; clc;
[x,fs] = audioread("czerwienszy_02_32_k.wav");
frame = 500;
window = bartlett(frame)';
overlap = 0;

[S,f,t] = spectrogram(x,window,overlap,frame,fs);
density = zeros(1,length(f));

for i = 1:length(f)
density(i) = sum(abs(S(i,:)))/frame;%wyznaczam średnią amplitudę każdej częstotliwości
end

subplot(3,1,1)
imagesc(f,t,abs(S));
colorbar
subplot(3,1,[2 3]);
grid on; hold on;
plot(0:fs/length(x):fs-fs/length(x),10*log10(abs(fft(x))/length(x)/max(x)),'b-')
xlim([0,fs/2]);
plot(f,10*log(density/max(density)),'LineWidth',2);