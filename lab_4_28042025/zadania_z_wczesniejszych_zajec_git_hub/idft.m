function [x, t] = idft(y)

x = zeros(size(y));
N = length(y);
t = 0:1:N-1;

for k = 1:N
    for n = 1:N
        x(k) = x(k) + y(n)*exp(2*pi*j*(n-1)*(k-1)/N);
    end
    x(k) = x(k)/N;
end
end