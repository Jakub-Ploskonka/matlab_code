%DFTv1
clc; close all; clear;

N=4; fs=1;
n=0:N-1;
k=0:N-1;
s=[2,3,2,1];
t=n;
f=k*fs/N;

S=zeros(1,N);
for p=0:N-1
    for r=0:N-1
        S(p+1)=S(p+1)+s(r+1)*exp(-j*2*pi*p/N*r);
    end
end
S=abs(S);

figure(1)
    stem(t,s,'go'); hold on; grid on;

figure(2)
    stem(f,S,'go'); hold on; grid on;
