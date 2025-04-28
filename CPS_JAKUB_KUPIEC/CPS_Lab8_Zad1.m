%CPS_Lab8
clc; clear; close all;

syg=2;
switch syg
    case 0
        N=200;
        n=0:N-1;
        fs=100;
        ts=n/fs;
        x=xpi((ts-1)/1.01);
        K=51;
        k=0:K-1;
        ts1=k/fs;
        h=1/20*sinc(fs/20*(ts1-0.25));
    case 1
        N=200;
        n=0:N-1;
        fs=100;
        ts=n/fs;
        x=xpi((ts-1)/1.01);
        K=51;
        k=0:K-1;
        ts1=k/fs;
        h=1/5*sinc(fs/5*(ts1-0.25));
    case 2
        N=400;
        n=0:N-1;
        fs=100;
        ts=n/fs;
        x=xpi((ts-2)/3).*(sin(2*pi*3*ts)+sin(2*pi*43*ts));
        K=51;
        k=0:K-1;
        ts1=k/fs;
        h=1/5*sinc(fs/5*(ts1-0.25));
end

y=conv(h,x);
y1=My_Conv(h,x);
M=N+K-1;
m=0:M-1;
ts2=m/fs;
%Kołowy
X=fft(x,M);
H=fft(h,M);
ykol=ifft(X.*H);



figure(1)
    subplot(4,1,1)
        plot(ts,x);
        grid on; hold on;
        title('x(t)');
    subplot(4,1,2)
        plot(ts1,h);
        grid on; hold on;
        title('h(t)');
    subplot(4,1,3)
        %plot(ts2,y);
        plot(ts2,y1);
        grid on; hold on;
        title('y(t)');
    subplot(4,1,4)
        plot(ts2,ykol);
        grid on; hold on;
        title('ykol(t)');

%Zad2
zp = 30;
hx = [h,zeros(1,zp)];
odp_imp=My_odp_imp(hx,zp);
odp_imp1 = impz(hx);
Dt=1/fs;
tl=0:Dt:Dt*length(odp_imp)-Dt;

figure(2)
    subplot(2,1,1)
        plot(tl,odp_imp);
        grid on; hold on;
        title('Odp impulsowa');
    subplot(2,1,2)
        plot(tl,odp_imp1);
        grid on; hold on;
        title('Wbudowana odp impulsowa');


%Zad3
Hcz = fft(h);
df = fs/K;
f = 0:df:df*K-df;
figure(3);
    subplot(2,1,1);
        stem(f, abs(Hcz)); hold on; grid on;
        %xlim([0,length(f)]);
        title("Moduł");
    subplot(2,1,2);
        stem(f, angle(Hcz)/pi); hold on; grid on;
        %xlim([0,length(f)]);
        title("Faza");
My_odp_imp_f(y,1,N,fs);
