% lab 5
% zad 2
clc; clear; close all;

f0=666; fs=3000;N=15;

wn = blackman(N).'*2.3833;


t=linspace(-6/f0,6/f0,1000000); %dziedzina czasowa
st=@(f,t) sin(2*pi*f*t); %funkcja pierwotna



ts=(0:1:N-1)/fs; % okres probkowania
xn=st(f0,ts); %probki

[to,xo]=odt(xn,fs);%odtwazanie

M=2^18; %rozszezenie zerami
xno=xn.*wn; %pomnozenie przez okno
xm=zeros(1,M-N);
xm=[xno,xm];

X=fft(xno); %widmo cyfrowe
X=fftshift(X);
X=X/N;

Xm=fft(xm); %widmo analogowe (odtwozne)
Xm=Xm/N;
Xm=fftshift(Xm);

f=(-1/2:1/N:1/2-1/N)*fs; %dziedina widma cyfrowego
fxm=(-1/2:1/M:1/2-1/M)*fs; % dziedina widma analogowego

ws = blackman(length(to)).'*2.3833;
 s=st(f0,to); %sygnał pierwotny z dziedina

%skala decybelowa
xdb=20*log10(abs(Xm)/(max(abs(Xm))));

 %wykresy
figure(1)
    subplot(2,1,1)
        plot(to,s,"b-");hold on; grid on;
        stem(ts,xn,"ro");
        plot(to,xo,"g-");
        title("Sygnał pierwotny z prubkami i odtwożeniem");
    subplot(2,1,2)
        plot(to,s.*ws,"b.-");hold on; grid on;
        stem(ts,xn.*wn,"ro");
        plot(to,xo.*ws,"g-");
        plot(to,ws,"c-")
        title("Sygnał pierwotny z prubkami i odtwożeniem (+okno)");
figure(2)
    subplot(3,1,1)
        stem(f,abs(X),"ro"); hold on; grid on;
        plot(fxm,abs(Xm),"b.-");
        xlabel("frequency [Hz]");
        ylabel("|Amplitude|");
        title("widmo cyfrowe i analogowe z oknem");
    subplot(3,1,2)
        stem(f,angle(X),"ro");  hold on; grid on;
        xlabel("frequency [Hz]");
        ylabel("Phase [radians]");
    subplot(3,1,3)
        plot(fxm,xdb,"g-");  hold on; grid on;
        xlabel("frequency [Hz]");
        ylabel("Amplitude[db]");
        title("widmo analogowe z oknem w skali decybelowej");

[F,I]=max(xdb);
err=abs(f0-abs(fxm(I)));

%disp(fxm(I));
disp("error: "+ num2str(err));
  %THE END