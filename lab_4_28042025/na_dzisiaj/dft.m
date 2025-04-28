function [y,f] = dft(x)


N = length(x);
% f = 0:1:N-1;
% f = -(N-1)/2 : 1 : (N-1)/2;
f = -2*(N-1) : 1 : 2*(N-1);
y = zeros(size(f));

for k = 1:length(f)
    for n = 1:N
        y(k) = y(k) + x(n)*exp(-2*pi*j*(n-1)*(f(k))/N);
    end
end
end