% Autor Jakub Ploskonka
% 02 06 2025
% zadanie 1 
% zadanie 2
% zadanie 3
clc; clear; close all

% wybor systemu
Syst = 4;

switch Syst
    case 1

% A
b = [0.08, 0.16, 0.08];
a = [1, -1.13, 0.54];
    case 2
% B
b = [0.11, -0.14, 0.11];
a = [1, 1.02, 0.37];
    case 3
% C
b = [2, -1, 0];
a = [1, 3/2, -0.5];
    case 4
% D
b = [3, 0.9876, 0];
a = [1, 1.9876, 0.9876];
end


N = 200; % 400
fs = 100;
Dt = 1/fs;
to = 0;
ts = to : Dt : to + Dt * N - Dt;
x1 = xpi((ts-0.6)/0.99);
x2 = xpi((ts-2)/3) .* (sin(6*pi*ts) + sin(90*pi*ts));

% zdanie 1

ts_odp = to : Dt : to + Dt * N-Dt;
y1 = My_odp_sys(x1,b,a,N);
y2 = My_odp_sys(x2,b,a,N);
yref1 = filter(b,a,x1);
tsref1 = to : Dt : to+Dt*length(yref1)-Dt;
yref2 = filter(b,a,x2);
tsref2 = to : Dt : to+Dt*length(yref2)-Dt;


  figure (1)
        stem(ts_odp, y1, 'bo'); grid on; hold on;
        stem(tsref1,yref1, 'rx');
        title('Odp. systemu moja funkcja i filter dla x1');
        

   figure(2)
        stem(ts_odp, y2, 'bo'); grid on; hold on;
        stem(tsref1,yref2, 'rx');
        title('Odp. systemu moja funkcja i filter dla x2');
        

% zadanie 2
h = My_odp_imp_2(b,a,N);
M = 1000;
h_zeros = [h, zeros(1,M)];
charak_czest = fft(h_zeros);
Df = fs/(M+N);
f_h = 0 : Df : fs - fs/(N+M);
    
     figure (3)

        subplot(2,1,1)
            stem(f_h, abs(charak_czest), 'b'); grid on; hold on;
            title('Charakterystyka czestotliwosciowa - modul');
        subplot(2,1,2)
             stem(f_h, angle(charak_czest)/pi, 'b'); grid on; hold on;
             title('Charakterystyka czestotliwosciowa - faza');

  % zadanie 3

z = roots(b);
p = roots(a);
circle = nsidedpoly(1000, 'Center', [0 0], 'Radius', 1);
[zref,pref,k]=tf2zpk(b,a);

figure(4)
    subplot(2,1,1)
        plot(circle,'FaceColor', 'none', LineWidth=2);grid on; hold on;
        stem(real(z),imag(z), 'bo',LineWidth=2);
        stem(real(p),imag(p), 'rx', LineWidth=2);
        axis equal;
        title('Rozkład zer i biegunów');
        xlabel('Real');
        ylabel('Imag');
    subplot(2,1,2)
        zplane(zref,pref); grid on;
        title('Funkcja wbudowana "zplane"')




% Funkcje
% xpi
function y = xpi(x)
y = zeros(size(x));
y(abs(x)<1/2)=1;
y(abs(x)==1/2)=1/2;
end

% My_odp_sys
function y = My_odp_sys(x,b,a,N)

x = [x, zeros(1,N-length(x))];
y = zeros(1,N);
B = zeros(1,length(b));
A = zeros(1,length(a)-1);

for n=1:N
    B = [x(n),B(1:end-1)];
    y(n) = sum(b.*B)-sum(a(2:end).*A);
    A = [y(n),A(1:end-1)];
end
end

%My_odp_imp_2
function h = My_odp_imp_2(b,a,N)

h = zeros(1,N);
B = zeros(1,length(b));%Delta kroneckera
A = zeros(1,length(a)-1);%Poprzednie odpowiedzi systemu
B(1) = 1;

for n = 1:N
   h(n) = sum(b.*B)-sum(a(2:end).*A);%b wsp przy x a przy y, przy drugim sum - bo y prenieśliśmy na drugą stronę
   B = [0,B(1:end-1)];%Przesunięcie delty
   A = [h(n),A(1:end-1)];%Przesunięcie odp systemu
end
end