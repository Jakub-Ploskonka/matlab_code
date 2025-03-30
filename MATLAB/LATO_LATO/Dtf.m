function [X,f] = Dtf(x_n)
% Obliczanie dysktretnej transfortmacji fouriera
% f_p - czestotliwosc probek
% t - dziedzina czasu
% f - funkcja z ktorej liczymy dtf

N = length(x_n);
X = zeros(1,N);
f=0:1:N-1

for k=1:N
    for n=1:N
        X(k) = X(k) + x_n(n)*exp(-j*2*pi*(k-1)/N*(n-1));
    end
end
