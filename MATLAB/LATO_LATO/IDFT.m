function x = IDFT(X)
    N = length(X);
    x = zeros(1, N);
    
    for n = 0:N-1
        x(n+1) = (1/N) * sum(X .* exp(1i * 2 * pi * n/N * (0:N-1)));
    end
end
