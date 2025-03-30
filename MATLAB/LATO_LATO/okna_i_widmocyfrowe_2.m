% lab 6
% zad 1
clc; clear; close all;

[x,fs]=CPS_LAB06_sygnal(3);

%t=linspace(-6/f0,6/f0,1000000); %dziedzina czasowa
%st=@(f,t) sin(2*pi*f*t)+ sin(2*pi*f2*t); %funkcja pierwotna

wn = blackman(length(x)).'*2.83;

fs = fs/2;

ts=(0:1:length(x)-1)/fs; % okres probkowania
xn=x; % probki

[to,xo]=odt(xn,fs); %odtwarzanie

M=2^18; % rozszerzenie zerami
xno=xn.*wn; % pomnozenie przez okno
xm=zeros(1,M-length(x));
xm=[xno,xm];

xno=xn.*wn;
X=fft(xno).*2; %widmo cyfrowe
X=fftshift(X);
X=X/length(x);

Xm=fft(xm).*2; %widmo analogowe (odtworzone)
Xm=Xm/length(x);
Xdb = Xm/length(x);
Xm=fftshift(Xm);


f=(-1/2:1/length(x):1/2-1/length(x))*fs; %dziedina widma cyfrowego
fxm=(-1/2:1/M:1/2-1/M)*fs; % dziedina widma analogowego

% ws = rectwin(length(to)).';

%skala decybelowa
xdb=10*log10(abs(Xm)/(max(abs(Xm))));

%wykresy
figure(2)
    subplot(3,1,1)
        stem(f((length(f)/2):end),abs(X((length(X)/2):end)),"ro"); hold on; grid on;
        plot(fxm((length(fxm)/2):end),abs(Xm((length(Xm)/2):end)),"b.-");
        xlabel("frequency [Hz]");
        ylabel("|Amplitude|");
        title("widmo z oknem");
        xlim([0 100]);
    subplot(3,1,2)
        stem(f,angle(X),"ro");  hold on; grid on;
        xlabel("frequency [Hz]");
        ylabel("Phase [radians]");
    subplot(3,1,3)
        plot(fxm,xdb,"g-");  hold on; grid on;
        xlabel("frequency [Hz]");
        ylabel("Amplitude[db]");
        title("w skali decybelowej");
        xlim([0 100]);
        ylim([-10 0]);
  %THE END