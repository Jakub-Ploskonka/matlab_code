clc; clear; close all;

fp = 1250; fr = 1750; fs = 8000; Rr = 50;
f0 = (fp+fr)/2;

% okno hamminga
a = 3.3;
%a = 5.6;

R = ceil(a*fs/(fr-fp));
K = R+1;

M = 8*K;
L = (M-2)/2;

Df = fs/M;
f = 0:Df:M*Df-Df;

o = floor(f0/Df);

HM = [1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
hx = fftshift(ifft(HM));

%hx = hx(floor(K/2)+1:floor(K/2)+K);
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2));

h = hx(:).*hamming(K);
%h = hx(:).*blackman(K);

n = 0:R;

figure();
    subplot(2,1,1);
    stem(f,HM,"b.");
    title('HM');
    xlabel('f(Hz)');
    ylabel('HM');

subplot(2,1,2);
    stem(h,"r.");
    title('h');
    xlabel('Próbki');
    ylabel('Amplituda');

%fir_1;
[H2, F2] = freqz(h,1,K*200,fs);
%fir_4;

figure();
    stem(f,abs(HM),"kd","fill");
    title('Magnitude of HM');
    xlabel('f[Hz]');
    ylabel('Moduł');

mode = 1;
switch(mode)
    case 1
        fs=8000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
end

y = conv(h,xs);

figure();
subplot(3,1,1);
    stem(xs,"r.");hold on;grid on;
    title("x");
    xlabel('Próbki');
    ylabel('Amplituda');
subplot(3,1,2);
    stem(h,"b.");hold on;grid on;
    title("h");
    xlabel('Próbki');
    ylabel('Amplituda');
subplot(3,1,3);
    stem(y,"g.");hold on;grid on;
    title("y");
    xlabel('Próbki');
    ylabel('Amplituda');


Df = fs/K;
f = 0:Df:Df*K-Df;

H = fft(h);
X = fft(xs);
Y = X(:).*H;

figure();
    subplot(3,1,1);
        stem(f,abs(X),"r.");hold on;grid on;
        xlim([0,fs/2]);
        title("X");
        xlabel('f[Hz]');
        ylabel('Moduł');
    subplot(3,1,2);
        stem(f,abs(H),"b.");;hold on;grid on;
        xlim([0,fs/2]);
        title("H");
        xlabel('f[Hz]');
        ylabel('Moduł');
    subplot(3,1,3);
        stem(f,abs(Y),"g.");hold on;grid on;
        xlim([0,fs/2]);
        title("Y");
        xlabel('f[Hz]');
        ylabel('Moduł');

hGP = sinc(n-R/2-1/2) - h.';

HGP = fft(hGP);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');

    subplot(3,1,2);
        stem(n,hGP,"r.");hold on;grid on;
        title('hGP');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,3);
        stem(f,abs(HGP),"r.");hold on;grid on;
        xlim([0,fs/2])
        title('FGP (Filtr górno przepustowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');

fx = 2000;

hPP = 2*cos(2*pi*fx/fs.*(n-R/2-1/2)).*(h.');
HPP = fft(hPP);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,2);
        stem(n,hPP,"r.");hold on;grid on;
        title('hPP');
        xlabel('Próbki');
        ylabel('Amplituda');;
    subplot(3,1,3);
        stem(f,abs(HPP),"r.");hold on;grid on;
        xlim([0,fs/2])
        title('FPP (Filtr pasmowo przepustowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');

hPZ = sinc(n-R/2-1/2) - hPP;

HPZ = fft(hPZ);

figure();
    subplot(3,1,1);
        stem(n,h,"b.");hold on;grid on;
        title('h');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,2);
        stem(n,hPZ,"r.");hold on;grid on;
        title('hPZ');
        xlabel('Próbki');
        ylabel('Amplituda');
    subplot(3,1,3);
        stem(f,abs(HPZ),"r.");hold on;grid on; 
        xlim([0,fs/2])
        title('FPZ (Filtr pasmowo zaporowy)');
        xlabel('f[Hz]');
        ylabel('Moduł');