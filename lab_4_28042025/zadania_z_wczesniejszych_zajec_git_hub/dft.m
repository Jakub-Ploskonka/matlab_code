function [y,f] = dft(x)

y = zeros(size(x));
N = length(x);
f = 0:1:N-1;

for k = 1:N
    for n = 1:N
        y(k) = y(k) + x(n)*exp(-2*pi*j*(n-1)*(k-1)/N);
    end
end
end