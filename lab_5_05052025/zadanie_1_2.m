% Autor: Jakub Płoskonka
% 5 05 2025
% Zjawisko przecieku w widmie dla sprobkowanego sygnalu analogowego
% od 0 do fs
% Zadanie 1


clc; close all; clear

% sygnal 1
f0 = 600; % Hz  
% sygnal 2
f02 = 666; %Hz

% parametry sygnalow
fs = 3000;  % fs
N = 15;     % N
n = 0 : N-1;
ts = n / fs;
dt = 0.00001;
to = 0;     % to
t = to : dt : N/fs;
%%%%%%%%%%%%%%%%%%%%%
% st1
st1 = 1/4 + sin(2*pi*f0*t);
x1 = 1/4 + sin(2*pi*f0*ts);

% st2
st2 = 1/4 + sin(2*pi*f02*t);
x2 = 1/4 + sin(2*pi*f02*ts);
%%%%%%%%%%%%%%%%%%%%%
% DFT1
X1 = MyDFT(x1);
k = n;
f = k*fs / N;
df = fs / N;

% DFT2
X2 = MyDFT(x2);
k = n;
f = k*fs / N;
df = fs / N;
%%%%%%%%%%%%%%%%%%%%%
% Sa1
sa1 = zeros(1,length(t));
for i = 1:N
sa1 = sa1 + x1(i) .* (sinc(fs*(t-n(i).*(1/fs))));
end 

% Sa2
sa2 = zeros(1,length(t));
for i = 1:N
sa2 = sa2 + x2(i) .* (sinc(fs*(t-n(i).*(1/fs))));
end
%%%%%%%%%%%%%%%%%%%%%
f1 = 0:f(end);

% CFT1
T = length(t) * dt;
for l = 1:length(f1)
        Sa1(l) = sum(sa1 .* exp(-j*2*pi*f1(l)*t)) * dt / T; % T normalizuje amplitude
end

% CFT2
for l = 1:length(f1)
        Sa2(l) = sum(sa2 .* exp(-j*2*pi*f1(l)*t)) * dt / T;
end

figure(1)

subplot(4,1,1)
        %plot(f1,abs(Sa1),'g-');grid on;hold on;
        stem(f,abs(X1),'bo');grid on;hold on;        
        title('f0=1000 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,2)
        stem(f,angle(X1)/pi,'bo');grid on;hold on;
        title('f0=1000 faza');
subplot(4,1,3)
        stem(f,abs(X2),'bo');grid on;hold on;
        %plot(f1,abs(Sa2),'g-');grid on;hold on;
        title('f02=1100 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,4)
        stem(f,angle(X2)/pi,'bo');grid on;hold on;
        title('f02=1100 faza');
        %plot(f1,abs(Sa1),'g-');grid on;hold on;

figure(2)

subplot(2,1,1)
        plot(t,st1,'g-', LineWidth=2);grid on;hold on;
        plot(t,sa1,'b-', LineWidth=2);grid on;hold on;
        legend('st1', 'sa1');
        ylabel('Amplituda');

subplot(2,1,2)
        plot(t,st2,'g-', LineWidth=2);grid on;hold on;
        plot(t,sa2,'b-', LineWidth=2);grid on;hold on;
        legend('st2', 'sa2');
        ylabel('Amplituda');

figure(3)

subplot(4,1,1)
        plot(f1,abs(Sa1),'g-');grid on;hold on;   
        title('f=1000 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,2)
        plot(f1,angle(Sa1)/pi,'b-');grid on;hold on;
        title('f=1000 faza');
subplot(4,1,3)
        plot(f1,abs(Sa2),'g-');grid on;hold on;
        title('f=1100 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,4)
        plot(f1,angle(Sa2)/pi,'b-');grid on;hold on;
        title('f=1100 faza');

figure(4)

        stem(f/2,abs(X1),'bo');grid on;hold on; 
        plot(f1,abs(Sa1),'g-');grid on;hold on;
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');


%MyDFT
function X=MyDFT(x)
N=length(x);
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
X=A*x(:) / N; % N normalizuje amplitude
end

%MyDFTV1
function X = MyDFTV1(x,k,n)
N = length(x);
w = exp(-1j*2*pi/N);
A = w.^(k(:)* n);
X = A*x(:) / N;
end 