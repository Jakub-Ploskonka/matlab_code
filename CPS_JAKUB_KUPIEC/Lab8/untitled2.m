clc; clear; close all;
syg =2;

N=400;
n=0:N-1;
fs=100;
ts=n/fs;
%x=xpi((ts-1)/1.01);
switch syg
    case 1
        x=xpi((ts-1)/1.01);
    case 2
        x=xpi((ts-2)/3).*(sin(2*pi*5*ts)+sin(2*pi*46*ts));
end
K=51;
k=0:K-1;
ts1=k/fs;
h=1/20*sinc(fs/20*(ts1-0.25));

y=conv(h,x);
y1=My_Conv(h,x);
M=N+K-1;
m=0:M-1;
ts2=m/fs;
%Kołowy
%X=fft(x,M);
%H=fft(h,M);
%ykol=ifft(X.*H);
ykol=cconv(h,x);
yko1=My_Cconv(h,x);

figure(1)
    subplot(4,1,1)
        stem(ts,x);
        grid on; hold on;
        title('x(t)');
    subplot(4,1,2)
        stem(ts1,h);
        grid on; hold on;
        title('h(t)');
    subplot(4,1,3)
        %plot(ts2,y);
        stem(ts2,y1);
        grid on; hold on;
        title('y(t)');
    subplot(4,1,4)
        stem(ts2,ykol);
        grid on; hold on;
        title('ykol(t)');


odp_imp=My_odp_imp(h);
odp_imp1 = impz(h);

figure(2)
    subplot(2,1,1)
        stem(ts1,odp_imp,'kx');grid on; hold on;
        stem(ts1,odp_imp1,'ro');
        title('Odp imp');
odpimpf(h,1,N,fs);


[z,p]=Mytf(h,1);
[z_y,p_y,k_y]=tf2zpk(h,1);
figure(3)
    plot(real(z),imag(z),'ko'); grid on; hold on;
    plot(real(p),imag(p),'bo'); grid on; hold on;
    title('My pole zero plot');
figure(4)
    zplane(z_y,p_y);



    