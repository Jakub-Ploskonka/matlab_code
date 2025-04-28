%Lab_16_04_Zad1
clc; clear; close all;
dt=0.00001;
N=20;
fs=3000;
t=0:dt:(N)/fs;
n=0:N-1;
ts=n/fs;

        %a
f0=600;
s1=sin(2*pi*f0*t);
x1=sin(2*pi*f0*ts);

%DFT
X1=MyDFT(x1);
k=n;
f=k*fs/N;

        %b
f0=666;
s2=sin(2*pi*f0*t);
x2=sin(2*pi*f0*ts);

%DFT
X2=MyDFT(x2);

%Sa
sa1=zeros(1,length(t));
for i=1:N
sa1=sa1+x1(i).*(sinc(fs*(t-n(i).*(1/fs))));
end

sa2=zeros(1,length(t));
for i=1:N
sa2=sa2+x2(i).*(sinc(fs*(t-n(i).*(1/fs))));
end

f1=0:f(end);
%CFT
for l=1:length(f1)
        Sa1(l)=sum(sa1.*exp(-j*2*pi*f1(l)*t))*dt;
end

for l=1:length(f1)
        Sa2(l)=sum(sa2.*exp(-j*2*pi*f1(l)*t))*dt;
end

figure(1)
    subplot(4,1,1)
        %plot(f1,abs(Sa1),'g-');grid on;hold on;
        stem(f,abs(X1),'bo');grid on;hold on;        
        title('f=600 modul');
    subplot(4,1,2)
        stem(f,angle(X1)/pi,'bo');grid on;hold on;
        title('f=600 faza');
    subplot(4,1,3)
        stem(f,abs(X2),'bo');grid on;hold on;
        plot(f1,abs(Sa2),'g-');grid on;hold on;
        title('f=666 modul');
    subplot(4,1,4)
        stem(f,angle(X2)/pi,'bo');grid on;hold on;
        title('f=666 faza');
        %plot(f1,abs(Sa1),'g-');grid on;hold on;

figure(2)
    subplot(2,1,1)
        plot(t,s1,'g-');grid on;hold on;
        plot(t,sa1,'b-');grid on;hold on;
    subplot(2,1,2)
        plot(t,s2,'b-');grid on;hold on;
        plot(t,sa2,'g-');grid on;hold on;
   
figure(3)
    subplot(4,1,1)
        plot(f1,abs(Sa1),'g-');grid on;hold on;   
        title('f=600 modul');
    subplot(4,1,2)
        plot(f1,angle(Sa1)/pi,'b-');grid on;hold on;
        title('f=600 faza');
    subplot(4,1,3)
        plot(f1,abs(Sa2),'g-');grid on;hold on;
        title('f=666 modul');
    subplot(4,1,4)
        plot(f1,angle(Sa2)/pi,'b-');grid on;hold on;
        title('f=666 faza');
        