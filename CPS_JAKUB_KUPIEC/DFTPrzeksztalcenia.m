%DFTPrzeksztalcenia
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
N=22;
t=0:dt:(N)/fs;
s=-1/4-sin(2*pi*f0*t);

z=[1,1/2,5/4];
for i=1:length(z)
    close all;
%Próbkowanie
n=0:N-1;
ts=n/fs;
x=-1/4-sin(2*pi*f0*ts)*z(i);
   
%DFT
n=0:N-1;
k=0:N-1;
X=MyDFT(x);
f=k*fs/N;

figure(1)
    plot(t,s*z(i),'b-');hold on; grid on;
    stem(ts,x,'go');

figure(2)
subplot(2,1,1)
    stem(f,abs(X),'bo');grid on;hold on;
    title('DFT modul');
%Zachowanie energii
for l=1:length(x)
    e(l)=abs(x(l))^2;
end

for l=1:length(x)
    E(l)=abs(X(l))^2;
end

en=sum(e)
En=sum(E)/N
pause;
end
