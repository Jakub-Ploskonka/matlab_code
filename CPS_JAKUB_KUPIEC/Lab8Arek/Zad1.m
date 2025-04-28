clc; clear; close all;

fs = 100;
probki = 1;
switch probki
    case 0
       N = 200;
    case 1
       N = 400;
end

Dt = 1/fs;
t0 = 0;

dt = 0.0001;

t = t0:dt:(N-1)*Dt;
ts = t0:Dt:(N-1)*Dt;

M = 51;
th = t0:Dt:(M-1)*Dt;

sygnal = 0;
switch sygnal
    case 0
    x = xpi((t-1)/1.01);
    xs = xpi((ts-1)/1.01);
    h = 1/20 * sinc(fs/20*(th-1/4));
    case 1
    x = xpi((t-1)/1.01);
    xs = xpi((ts-1)/1.01);
    h = 1/5 * sinc(fs/5*(th-1/4));
    case 2
    x = xpi((t-2)/3).*(sin(2*pi*3*t)+sin(2*pi*43*t));
    xs = xpi((ts-2)/3).*(sin(2*pi*3*ts)+sin(2*pi*43*ts));
    h = 1/5 * sinc(fs/5*(th-1/4));
end

K = N+M-1;

tk = t0:Dt:Dt*K-Dt;

spLin1 = myConv(h, xs);
spLin2 = conv(h,xs);


spKol = myCconv(h, xs);
spKol2 = cconv(h,xs);

figure(1); 
    subplot(2,1,1);
        plot(t,x,"r"); hold on; grid on;
        stem(ts,xs,"b");
        title("x(t)")
    subplot(2,1,2);
        
        stem(th,h,"g"); hold on;grid on;
        title("h(t)")

figure(2);
    stem(tk, spLin1,"k"); hold on; grid on;
    stem(tk, spLin2,"bx");
    title("Sploty liniowe");
    legend(["myConv" "conv"]);

figure(3)
    stem(tk, spKol); hold on; grid on;
    stem(tk, spKol2, "r*");
    title("Sploty kołowe");
    legend(["myCconv" "cconv"]);

figure(4)
    stem(tk, spLin1, "."); hold on; grid on;
    stem(tk, spLin2, "*"); 
    stem(tk, spKol, "x");
    stem(tk, spKol2);
    title("wszystkie sploty");
    legend(["myConv" "conv" "myCconv" "cconv"]);

%odpowiedź impulsowa
zp = 30;
hx = [h,zeros(1,zp)];
y = odp_imp(hx,zp);
y1 = impz(hx);
L = length(y);
tl = t0:Dt:Dt*L-Dt;


%wykres odpowiedzi
figure(5);
    stem(tl, y); hold on; grid on;
    stem(tl, y1);
    title("Odpowiedź impulsowa");
    legend(["odp_imp" "impz"]);

Hcz = fft(h);
Df = fs/M;

fh = 0:Df:Df*M-Df;

figure(6);
    subplot(2,1,1);
        stem(fh, abs(Hcz), "m"); hold on; grid on;
        xlim([0,length(fh)]);
        title("Moduł");
    subplot(2,1,2);
        stem(fh, angle(Hcz)/pi, "m"); hold on; grid on;
        xlim([0,length(fh)]);
        title("Faza");