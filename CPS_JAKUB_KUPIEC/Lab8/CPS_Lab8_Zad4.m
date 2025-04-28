%CPS_Lab8_Zad4
clc; clear; close all;

N=200;
n=0:N-1;
fs=100;
ts=n/fs;
x=xpi((ts-1)/1.01);
K=51;
k=0:K-1;
ts1=k/fs;
h=1/20*sinc(fs/20*(ts1-0.25));
y=conv(h,x);

dz=0.1;
[X,Y]=meshgrid(-4:dz:4,-4:dz:4);
z=X+j*Y;
Zy=zeros(length(z(1,:)),length(z(:,1)));
    for k=1:length(z(1,:))
        for l=1:length(z(:,1))
            for i=1:N
                Zy(k,l)=Zy(k,l)+y(i)*z(k,l)^(-(i-3));
            end
        end
    end

dz=0.1;
[X,Y]=meshgrid(-4:dz:4,-4:dz:4);
z=X+j*Y;
Zx=zeros(length(z(1,:)),length(z(:,1)));
    for k=1:length(z(1,:))
        for l=1:length(z(:,1))
            for i=1:N
                Zx(k,l)=Zx(k,l)+x(i)*z(k,l)^(-(i-3));
            end
        end
    end

 figure(1)
 subplot(2,1,1)
        mesh(X,Y,abs(Zy));
        grid on;
 subplot(2,1,2)
        mesh(X,Y,abs(Zx));
        grid on;

 Zh=Zy/Zx;
 zer=zero(Zh);
 p=pole(Zh);
 

 
