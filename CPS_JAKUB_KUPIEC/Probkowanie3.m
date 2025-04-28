%Probkowanie3
clc; close all; clear all;
%Tworzenie sygnału
dt=0.01;
t=-5:dt:5;
td=0; %Opóźnienie
T=3; %Szerokość

y=xtri(t,td,T);

%Probkowanie
N=30;
n=-15:N/2-1;
fs=3; %f probkowania
ts=n*1/fs; %czas dyskretny
x=xtri(ts,td,T);

%Odtwarzanie
odtw=zeros(1,length(t));
for i=1:N
odtw=odtw+x(i).*sin(pi*fs*(t-n(i)*1/fs))./(pi*fs*(t-n(i)*1/fs));
%odtw=odtw+x(i).*sin(pi*fs*(t-n(i).*(1/fs)))./(pi*fs*(t-n(i).*(1/fs)));
end



figure(1)
    plot(t,y,'r-'); hold on;
    stem(n/fs,x,'go');%próbki
figure(2)
    plot(t,odtw,'b-'); hold on;