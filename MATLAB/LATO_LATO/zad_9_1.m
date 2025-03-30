clc; clear; close all; %splot kołowy i liniowy
N=200;
fs=100;
t0=0;
K=51;

M=K+N-1;
tx=t0:1/fs:(N-1)/fs+t0;
th=t0:1/fs:(K-1)/fs+t0;
ts=t0:1/fs:(M-1)/fs+t0;

x=xpi(tx,1,1.01);
p=xpi(tx,2,3).*(sin(6*pi*tx)+sin(92*pi*tx));

h=(1/5)*sinc(fs/5*(th-1/4));

figure(1)
subplot(2,1,1)
stem(tx,x); grid on;
subplot(2,1,2)
stem(th,h); grid on;

sl=lin_conv(h,x);
sl2=conv(h,x);

sc=circ_conv(h,x,M);
sc2=cconv(h,x);

figure(2)
subplot(2,1,1)
stem(ts, sl, 'm o'); grid on; hold on;
stem(ts, sl2, 'b x');
subplot(2,1,2)
stem(ts, sc, 'm o'); grid on; hold on;
stem(ts, sc2, 'b x');

figure(3)
stem(ts, sl, 'm o'); grid on; hold on;
stem(ts, sc, 'g x'); grid on; hold on;

z=imp_ans(h, 20);

figure(4)
stem(z); grid on;

hzer=[z(:); zeros(1000,1)];
X=fft(hzer);
M=length(hzer);
f=fs*(0:M-1)/M;

figure(5)
subplot(3,1,1)
stem(th,h); grid on;
subplot(3,1,2)
plot(f,abs(X)/M); grid on;
subplot(3,1,3)
plot(f,angle(X)/pi); grid on;

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