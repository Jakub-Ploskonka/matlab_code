%LabDFT2Zad1V1
%LabDFT2Zad1
clc; close all; clear;
dt=0.00001;
f0=4000;
fs=12000;
N=21;
t=0:dt:(N)/fs;
s=-1/4-sin(2*pi*f0*t);

f=-2.5*fs:10:2.5*fs;

%CFT
for l=1:length(f)
        S(l)=sum(s.*exp(-j*2*pi*f(l)*t))*dt;
end

%Próbkowanie
n=0:N-1;
ts=n/fs;
x=-1/4-sin(2*pi*f0*ts);
   
%DFT
n=0:N-1;
k=-2*N:N*2-1;
X=MyDFTV1(x,k,n);
fd=k*fs/N;

%Odtwarzanie sa(t)
sa=zeros(1,length(t));
for i=1:N
sa=sa+x(i).*sinc(fs*(t-n(i).*(1/fs)));
%sa=sa+x(i).*sinc(fs*(t-n(i).*(1/fs)));
end

%Sa(f)
for l=1:length(f)
        Sa(l)=sum(sa.*exp(-j*2*pi*f(l)*t))*dt;
end

figure(1)
    subplot(3,2,1)
    plot(t,s,'b-');hold on; grid on;
    title('s(t)');

    subplot(3,2,2)
    plot(f,abs(S),'b-');hold on; grid on;
    title('S(f)');

    subplot(3,2,3)
    stem(ts,x,'b-');hold on; grid on;
    title('x(n)');

    subplot(3,2,4)
    stem(fd,abs(X),'b-');hold on; grid on;
    stem(fs/2,0,'ro');hold on;
    stem(-fs/2,0,'ro');hold on;
    title('X(k)');

    subplot(3,2,5)
    plot(t,sa,'b-');hold on; grid on;
    title('sa(t)');

    subplot(3,2,6)
    plot(f,abs(Sa),'b-');hold on; grid on;
    title('Sa(f)');



