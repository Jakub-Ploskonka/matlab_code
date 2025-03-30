clc; clear; close all;

fs = 100;
N = 200;
t0 = 0;
Dt = 1/fs;

ts = t0:Dt:t0+Dt*N-Dt;

x = xpi((ts-0.7)/0.99);

L = 80;
y = odp_sys(x,b,a,L);

figure(1);
subplot(3,1,1); 
stem(ts,x,"r");title("x(t)")

ts2 = t0:Dt:t0+Dt*L-Dt;

subplot(3,1,2);
stem(ts2,y,"g");hold on; xlim([t0,t0+Dt*N-Dt]);title("y(t)");

y2 = filter(b,a,x);

stem(ts,y2,"mx");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=50;
fs=100;
t0=0;
K=400;

M=K+N-1;
tx=t0:1/fs:(N-1)/fs+t0;
tp=t0:1/fs:(K-1)/fs+t0;


x=xpi(tx,0.7,0.99); % funkcja x(t)
p=xpi(tp,2,3).*(sin(6*pi*tp)+sin(96*pi*tp)); % funkcja p(t)


n = 3;
switch n
    case 1
        a=[1 -1/2];
        b=[1 1];
        h = impz(b,a)
    case 2
        a=[1 1/2];
        b=[1 1];
    case 3
        a=[1 3/2 -1/2];
        b=[2 -1];
    case 4
        a=[1];
        b=[2 -1 -1/2 1/2];
end


 figure(1) % wykres funkcji x(t) i p(t)
 subplot(2,1,1)
 stem(x); grid on;
 subplot(2,1,2)
 stem(p); grid on;

 figure(2)
 stem(impz(b,a));






function x=xpi(t,t0,T)
Nt=length(t);
x=zeros(1,Nt);
x((t>=t0-T/2)&(t<t0+T/2))=1;
end

function splot=lin_conv(h,x)
splot=zeros(length(h)+length(x)-1,1);
for a=1:length(h)
    for b=1:length(x)
        splot(a+b-1)=splot(a+b-1)+h(a)*x(b);
    end
end
end

function splot=circ_conv(h,x,m)
    h2=[h(:); zeros(m-length(h),1)];
    x2=[x(:); zeros(m-length(x),1)];
    splot=real(ifft(fft(x2).*fft(h2)));
end

function z=imp_ans(h,P)
    d=zeros(1,P);
    d(1)=1;

    z=zeros(1,P);
    hx=zeros(1,length(h));
    for n=1:P
        hx=[d(n), hx(1:(end-1))];
        z(n)=sum(h.*hx);
    end    
end