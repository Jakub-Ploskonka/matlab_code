clc; clear; close all;

x = 1:26;

N = length(x);
L = 10;
overlap=5;

modulo=mod(N,L-2);
z_amount=L-modulo;

x=[x(:);zeros(z_amount,1)]

N = length(x);
Q = N/(L-overlap);
a=L-overlap;
for q = 1:Q-1
    y(q,:)=x((q-1)*a+1:(q-1)*a+L);
end

y