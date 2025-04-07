% x - sygnał dyskretny
% X - widmo sygnału dyskretnego


function [X,fk] = dft(x)

X = zeros(size(x));
N = length(x);
fk = 0:1:N-1;

for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) .* exp(-j*2*pi*(n-1)*(k-1)/N);
    end
end
end