function X = DFT(x)
    N = length(x);
    X = zeros(1, N);
    
    for k = 0:N-1
        X(k+1) = sum(x .* exp(-1i * 2 * pi * k/N * (0:N-1)));
    end
end