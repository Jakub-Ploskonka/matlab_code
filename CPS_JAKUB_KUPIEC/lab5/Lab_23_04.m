%Lab_23_04_Zad1
close all; clc; clear;

[x,fs]=CPS_LAB06_sygnal(3);
N=length(x);
X=MyDFT(x);
k=0:N-1;
fk=k*fs/N;

w1 = rectwin(N);
w1 = w1';
ratio = sum(rectwin(N))/sum(w1);
xs1 = x.*w1*ratio;
XS1 = MyDFT(xs1);

w2 = hamming(N);;
w2 = w2';
ratio = sum(rectwin(N))/sum(w2);
xs2 = x.*w2*ratio;
XS2 = MyDFT(xs2);

w3 = hann(N);
w3 = w3';
ratio = sum(rectwin(N))/sum(w3);
xs3 = x.*w3*ratio;
XS3 = MyDFT(xs3);

w4 = blackman(N);
w4 = w4';
ratio = sum(rectwin(N))/sum(w4);
xs4 = x.*w4*ratio;
XS4 = MyDFT(xs4);

M = 1000;
xsr = [x,zeros(1,M)];
XSr = MyDFT(xsr);
fr = 0:fs/(N+M):fs - fs/(N+M);

xsr1 = [xs1,zeros(1,M)];
XSr1 = MyDFT(xsr1);

xsr2 = [xs2,zeros(1,M)];
XSr2 = MyDFT(xsr2);

xsr3 = [xs3,zeros(1,M)];
XSr3 = MyDFT(xsr3);

xsr4 = [xs4,zeros(1,M)];
XSr4 = MyDFT(xsr4);






subplot(5,1,1)
    grid on;hold on;
    stem(fk,abs(X)/N,'kx');
    plot(fr,abs(XSr)/N);
    title('DFT');
subplot(5,1,2)
    grid on;hold on;
    stem(fk,abs(XS1)/N,'kx');
    plot(fr,abs(XSr1)/N);
    title('DFT rectwin');
subplot(5,1,3)
    grid on;hold on;
    stem(fk,abs(XS2)/N,'kx');
    plot(fr,abs(XSr2)/N);
    title('DFT hamming');
subplot(5,1,4)
    grid on;hold on;
    stem(fk,abs(XS3)/N,'kx');
    plot(fr,abs(XSr3)/N);
    title('DFT hann');
subplot(5,1,5)
    grid on;hold on;
    stem(fk,abs(XS4)/N,'kx');
    plot(fr,abs(XSr4)/N);
    title('DFT blackman');