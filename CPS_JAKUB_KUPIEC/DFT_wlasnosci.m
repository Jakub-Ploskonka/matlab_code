%DFT_wlasnosci
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
N=22;
t=0:dt:(N)/fs;
s=-1/4-sin(2*pi*f0*t);
%Próbkowanie
n=0:N-1;
ts=n/fs;
x1=1/4+sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=0:N-1;
X1=MyDFT(x1);
f=k*fs/N;

x2=2*x1;
X2=MyDFT(x2);

figure(1)
    stem(f,abs(X1)*2,'bo');grid on;hold on;
    stem(f,abs(X2),'rx');
    title('DFT modul');

%Zachowanie energii
for l=1:length(x1)
    e(l)=abs(x1(l))^2;
end

for l=1:length(x1)
    E(l)=abs(X1(l))^2;
end

en=sum(e)
En=sum(E)/N