%Probkowanie 1
clc;clear all; close all;
t=0:0.01:5;
N=100;%liczba probek
n=0:N-1;%probki
fs=20;%czestotliwosc probkowania
fo=2;%czestotliwosc sygnalu
ts=n./fs;


x=cos(2*pi*fo*t);%sygnal probkowany
X=cos(2*pi*fo*ts);%sygnal sprobkowany

odtw=zeros(1,length(t));
for i=1:N
odtw=odtw+X(i).*(sin(pi*fs*(t-n(i).*(1/fs))))./(pi*fs*(t-n(i).*(1/fs)));
end

figure(1)
    plot(t,x,'r-');hold on;
    plot(t,odtw,'b-')