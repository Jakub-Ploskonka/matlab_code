function [S,f,t] = STFT(x,fs,nfft,window,frame,overlap);

x = [x,zeros(1,mod(length(x),(frame-overlap)))];

f = 0:fs/nfft:fs - fs/nfft;


S = zeros(length(f),1);

for i = round(1:length(x)/(frame-overlap):length(x))
xframe = x(i:i+frame-1);
xframe = xframe.*window;
xframe = [xframe,zeros(1,nfft-length(xframe))];
Xframe = fft(xframe);
S(:,end+1) = Xframe;
end

S = S(:,2:end);
t = (0:size(S,2)-1)*2*frame/fs;
end



