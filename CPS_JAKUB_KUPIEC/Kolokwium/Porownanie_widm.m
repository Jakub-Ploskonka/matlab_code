%Porównanie widm
dt=0.01;
t=0:dt:2;
s=2*cos(2*pi*5*t);
fs=100;
f=-2*fs:0.1:2*fs;
S=zeros(1,length(f));

%CFT
for i=1:length(f)
    S(i)=sum(s.*exp(-j*2*pi*f(i)*t))*dt;
end
N=100;
n=0:N-1;
tx=n/fs;
x=2*cos(2*pi*5*tx);
X=fft(x);
fx=-fs/2:fs/N:fs/2-fs/N;

figure(1)
    plot(f,abs(S));grid on; hold on;
    stem(fx,abs(fftshift(X))/N);
