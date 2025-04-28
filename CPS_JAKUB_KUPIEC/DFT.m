%DFT
clc; close all; clear;
f0=1; l=2; t=0:0.001:3;
fs=5;

s=funk(t,f0,l);

N=3*fs;
n=0:N-1;
ts=n/fs;
x=funk(ts,f0,l);

odtw=zeros(1,length(t));
for i=1:N
    odtw=odtw+x(i).*sin(pi*fs*(t-n(i).*(1/fs)))./(pi*fs*(t-n(i).*(1/fs)));
end

figure(1)
plot(t,s,'b-'); hold on;grid on
plot(t,odtw,'g-'); hold on;
stem(n/fs,x,'ro');hold on

%Transformata DFT
f=n*fs/N;
k=n;
S=zeros(1,N);
for p=0:N-1
    for r=0:N-1
        %S(p)=S(p)+s(r)*exp(-j*2*pi*p/N*r);
        S(p+1)=S(p+1)+s(r+1)*exp(-j*2*pi*p/N*r);
    end
end
S=abs(S);

figure(2)
    stem(f,S,'ro'); hold on; grid on;


function y=funk(t,f0,k)
y1=sin(2*pi*f0*t);
y2=zeros(1,length(t));
y2(t<(k/f0))=1;
y=y1.*y2;
end

%S=zeros(1,length(f));
%deltat=1/fs;
%for i=1:N
%S=S+s(i)*exp(-j*2*pi*f*i*deltat);
%end
%S=S*deltat;
%S=deltat*sum(s(n)*exp(-j*2*pi*f*n*deltat));
%figure(2)
%plot(f,S,'b-'); hold on;grid on