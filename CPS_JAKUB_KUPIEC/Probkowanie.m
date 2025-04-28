clc;clear all; close all;
t=0:0.01:5;
%Sygnal 
f=1;
s=sin(2*pi*f*t);
fs=0.1;%f probkowania

%sygnal sprobkowany
x=zeros(1,t(end)/fs+1);
n=0:fs:t(end);
x=sin(2*pi*f*n);

%sygnal sprobkowany dopasowanie do wykresu
y=zeros(1,length(t));
k=1;
for z=0:fs:t(end)
y(k)=sin(2*pi*f*z);
k=k+10;
end

%Sygnal odtworzony
odtw=zeros(1,length(t));
%cos nie dziala
%for z=1:length(n)
odtw=odtw+(sin(pi*fs*(t-n(50)/fs)))./(pi*fs*(t-n(50)/fs));
%end
odtw=sin(pi*t)./(pi*t);

figure(1)
    plot(t,s,'r-');hold on;
    plot(t,y,'bo')
    plot(t,odtw,'b-')
