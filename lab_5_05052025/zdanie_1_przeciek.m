% Autor: Jakub Płoskonka
% 5 05 2025
% Zjawisko przecieku w widmie dla sprobkowanego sygnalu analogowego
% od -fs/2 do fs/2
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
st1 = sin(2*pi*f0*t);
x1 = sin(2*pi*f0*ts);

% st2
st2 = sin(2*pi*f02*t);
x2 = sin(2*pi*f02*ts);
%%%%%%%%%%%%%%%%%%%%%
% DFT1
k = -2*N:2*N-1;
fk = k*fs / N;
%fk = k*(fs/4) / N;
df = fs / N;
X1 = MyDFTV1(x1,k,n);


% DFT2
k = -2*N:2*N-1;
fk = k*fs / N;
%fk = k*(fs/4) / N;
df = fs / N;
X2 = MyDFTV1(x2,k,n);

%[ x2  0 0 0 0 0 0 0 0]
% M = 128;
% deltaf = fs/M;
% X2 = zeros(size(fk));
% for g = 1:N
%         X2 = 
% end
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
f1 = -2*fs:N:2*fs; % wektor czestotliwosci
%f1 = -fs/2 :N: fs/2;
T = length(t) * dt; % normalizacja amplitudy CFT
% CFT1
for l = 1:length(f1)
        Sa1(l) = sum(sa1 .* exp(-j*2*pi*f1(l)*t)) * dt / T; % T normalizuje amplitude 
end

% CFT2
for l = 1:length(f1)
        Sa2(l) = sum(sa2 .* exp(-j*2*pi*f1(l)*t)) * dt / T; % T normalizuje amplitude
end

Sa2 = zeros(size(f1));
for q = 1:N
        Sa2 = Sa2 + x2(q)*my_pi(f1/fs).*exp(-j*2*pi*f1*(q-1)/fs);
end
Sa2 = Sa2 / N;


figure(1)

subplot(4,1,1)
        stem(fk,abs(X1),'bo');grid on;hold on;        
        title('f0=600 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,2)
        stem(fk,angle(X1)/pi,'bo');grid on;hold on;
        title('f0=600 faza');
subplot(4,1,3)
        stem(fk,abs(X2),'bo');grid on;hold on;
        title('f02=666 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,4)
        stem(fk,angle(X2)/pi,'bo');grid on;hold on;
        title('f02=666 faza');
figure(2)

subplot(2,1,1)
        title('f02=600 faza');
        plot(t,st1,'g-', LineWidth=2);grid on;hold on;
        plot(t,sa1,'b-', LineWidth=2);grid on;hold on;
        legend('st1', 'sa1');
        ylabel('Amplituda');

subplot(2,1,2)
        title('f02=666');
        plot(t,st2,'g-', LineWidth=2);grid on;hold on;
        plot(t,sa2,'b-', LineWidth=2);grid on;hold on;
        legend('st2', 'sa2');
        ylabel('Amplituda');

figure(3)

subplot(4,1,1)
        plot(f1,abs(Sa1),'g-');grid on;hold on;   
        title('f=600 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,2)
        plot(f1,angle(Sa1)/pi,'b-');grid on;hold on;
        title('f=600 faza');
subplot(4,1,3)
        plot(f1,abs(Sa2),'g-');grid on;hold on;
        title('f=666 modul');
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(4,1,4)
        plot(f1,angle(Sa2)/pi,'b-');grid on;hold on;
        title('f=666 faza');

figure(4)

subplot(2,1,1)
        title('f0=600 faza');
        stem(fk,abs(X1),'bo', LineWidth=2);grid on;hold on; 
        plot(f1,abs(Sa1),'g-', LineWidth=2);grid on;hold on;
        plot((-fs/2),0,'ro', LineWidth=2);grid on;hold on;
        plot((fs/2),0,'ro', LineWidth=2);grid on;hold on;
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');
subplot(2,1,2)
        title('f02=666');
        stem(fk,abs(X2),'bo', LineWidth=2);grid on;hold on; 
        plot(f1,abs(Sa2),'g-', LineWidth=2);grid on;hold on;
        plot((-fs/2),0,'ro', LineWidth=2);grid on;hold on;
        plot((fs/2),0,'ro', LineWidth=2);grid on;hold on;
        xlabel('Czestotliwosc');
        ylabel('Amplituda - modul');

%MyDFT
function X = MyDFT(x)
N=length(x);
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N);
A=w.^(k(:)* n);
X=A*x(:) / N; % N normalizuje amplitude
end

%MyDFTV1
function X = MyDFTV1(x,k,n)
N = length(x);
w = exp(-1j*2*pi/N);
A = w.^(k(:)* n);
X = A*x(:) / N;
end 

% funkcja syg_sin(t,k,fo)
function y = my_pi(t)

% y = zeros(size(t)) + 1;
y = zeros(size(t)) + 1;
y(t>0.5) = 0;
y(t<-0.5) = 0;
y(t==0.5) = 0.5;
y(t==-0.5) = 0.5;
end