%Próbkowanie_syg_i_przeciek
%Określenie zjawiska przecieku
t=0:0.01:10;
s=5+2*sin(200*pi*t)+cos(1200*pi*t+0.75*pi)+sin(2200*pi*t-0.25*pi)-3*sin(400*pi*t);
fs=1000;
N=10;
n=0:N-1;
Dt=1/fs;
tx=n*Dt;
x=5+2*sin(200*pi*tx)+cos(1200*pi*tx+0.75*pi)+sin(2200*pi*tx-0.25*pi)-3*sin(400*pi*tx);

X=fft(x);
Df=fs/N;
f=0:Df:fs-Df;

figure(1)
subplot(3,1,1)
    plot(t,s,'b-'); grid on; hold on;
subplot(3,1,2)
    plot(tx,x,'ro'); grid on; hold on;
subplot(3,1,3)
    stem(f,abs(X)/N,'gx'); grid on; hold on;

