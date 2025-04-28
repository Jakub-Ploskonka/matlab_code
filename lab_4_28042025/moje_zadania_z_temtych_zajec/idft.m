function [x, t] = idft(y)

x = zeros(size(y));
N = length(y);
t = 0:N-1;

for k = 1:N
    for n = 1:N
        x(k) = x(k) + y(n)*exp(j*2*pi*(n-1)*(k-1)/N);
    end
    x(k) = x(k)/N;
end
end