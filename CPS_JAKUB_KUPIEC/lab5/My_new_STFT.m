function [S,f,t] = My_New_STFT(x,fs,nfft,window,frame,overlap);%frame długość ramek, nfft ilość elementów fft

x = [x,zeros(1,mod(length(x),(frame-overlap)))];%zapewniamy sobie że x ma długość wielokrotności frame, aby można było policzyć każdą ramkę

f = 0:fs/nfft:fs - fs/nfft;

S = zeros(length(f),1);

for i = 1:length(x)/(frame-overlap);
    xframe = x((i-1)*frame+1:min((i-1)*frame+1+frame-1,length(x)));%bierzemy xsy do ramki dla której będziemy liczyć fft, min zabezpieczenie żeby nie wyjść poza zakres
    xframe = xframe.*window;%przemnażamy go przez okno
    xframe = [xframe,zeros(1,nfft-length(xframe))];%rozszerzamy o zera aby się zgadzało z nfft
    Xframe = fft(xframe);%obliczamy fft ramki
    S(:,end+1) = Xframe;%dodajemy do naszego wyniku
end

S = S(:,1:end);
t = (0:size(S,2)-1)*frame/fs;%obliczenie czasu
end