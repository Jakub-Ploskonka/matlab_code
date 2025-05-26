function y = My_CircularConv(x, h)
    % Sprawdzenie długości i dopasowanie
    N = length(x);
    M = length(h);
    
    if M ~= N
        % Dopasuj długości przez dopełnienie zerami do długości N
        if M < N
            h = [h, zeros(1, N - M)];
        else
            x = [x, zeros(1, M - N)];
            N = M;
        end
    end

    % Wynik
    y = zeros(1, N);

    % Obliczenie splotu kołowego
    for n = 1:N
        for k = 1:N
            % Indeks modulo N dla kołowego splotu
            index = mod(n - k, N);
            if index == 0
                index = N; % MATLAB nie lubi indeksu 0
            end
            y(n) = y(n) + x(k) * h(index);
        end
    end
end




function cc = my_cconv(a,b)

L = length(a)+length(b)-1;

a = [a, zeros([1,L-length(a)])];
b = [b, zeros([1,L-length(b)])];

cc = ifft(fft(a).*fft(b));
cc = cc(1:L);