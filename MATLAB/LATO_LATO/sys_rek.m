clc; clear; close all;

selSys = 2;

switch selSys
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
    case 5
        b = [1];
        a = [1, 1/2];
    case 6
        b = [1];
        a = [1, -1/2];
end

% zad.1

fs = 100;
N = 200;
t0 = 0;
Dt = 1/fs;

ts = t0:Dt:t0+Dt*N-Dt;

x = xPI(ts,0.7,0.99);

L = 80;
y = odp_sys(x,b,a,L);

figure(1);
subplot(3,1,1); 
stem(ts,x,"k");title("x(t)")

ts2 = t0:Dt:t0+Dt*L-Dt;

subplot(3,1,2);
stem(ts2,y,"b");hold on; xlim([t0,t0+Dt*N-Dt]);title("y(t)");

y2 = filter(b,a,x);





