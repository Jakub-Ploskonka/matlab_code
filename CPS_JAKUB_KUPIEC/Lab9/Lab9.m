%Lab9
clc; clear; close all;

Syst = 1;
%Wybór systemu
switch Syst
    case 1
        b = [2, 3];
        a = [1, -1/2];
    case 2
        b = [2, 3];
        a = [1, 1/2];
    case 3
        b = [2, -1];
        a = [1, 3/2, -1/2];
    case 4
        b = [2, -1];
        a = [1, 1/2, -1/2];
    %Kolejne zadanie
    case 5
        b = [1];
        a = [1, 1/2];
    case 6
        b = [1];
        a = [1, -1/2];
end

%Parametry
fs = 100;
t0 = 0;
Dt = 1/fs;

%Zad1
L=40;
h = My_odp_imp_2(b,a,L);
ts = t0:Dt:t0+Dt*L-Dt;

href = impz(b,a,L);
tsref = t0:Dt:t0+Dt*length(href)-Dt;

figure(1)
        stem(ts,h,"bo"); grid on; hold on;
        stem(tsref,href,'rx');
        title("h(t)");

%Zad2
%Charakterystyka f to poprosu fft odp imp
Hcz = fft(h);
Nh = length(h);
Df = fs/Nh;

fh = 0:Df:Df*Nh-Df;

figure(2)
    subplot(2,1,1)
        stem(fh,abs(Hcz)); grid on; hold on;
        title('Moduł H(f)');
    subplot(2,1,2)
        stem(fh,angle(Hcz)/pi); grid on; hold on;
        title('Faza H(f)');
%Zad3
N = 100;
tsyg = t0:Dt:t0+Dt*N-Dt;
L=40;
ts3 = t0:Dt:t0+Dt*L-Dt;
x = xpi((tsyg-0.7)/0.99);
y=My_odp_sys(x,b,a,L);
yref = filter(b,a,x);
tsref=t0:Dt:t0+Dt*length(yref)-Dt;

figure(3);
    subplot(2,1,1); 
        stem(tsyg,x);title("x(t)");grid on; hold on;    
    subplot(2,1,2);
        stem(ts3,y,"go");hold on; grid on;
        stem(tsref,yref,"mx");hold on;
        title('Odpowiedź systemu');
%Zad4
z = roots(b);
%if(length(z)~=length(b)-1)
%    z=[z,zeros((length(b)-1)-length(z))];
%end
p = roots(a);
circle = nsidedpoly(1000, 'Center', [0 0], 'Radius', 1);
[zref,pref,k]=tf2zpk(b,a);

figure(4);
subplot(2,1,1)
    plot(circle,'FaceColor', 'none');grid on; hold on;
    stem(real(z),imag(z),"mo");
    stem(real(p),imag(p),"rx");
    title('Rozkład zer i biegunów');
subplot(2,1,2)
    zplane(zref,pref);
    grid on;

%Zad5
X=-4:0.1:4;
Y=-4:0.1:4;
Hz=ZTransform(x,X,Y);







