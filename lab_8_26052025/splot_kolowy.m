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


% FFT bez zmiany K
Hcz = fft(h, K);
Hcz_shifted = fftshift(Hcz);
f = (-K/2 : K/2 - 1) * (fs/K);

% Interpolacja (np. 10x gęściej)
f_dense = linspace(min(f), max(f), 10*K);  % nowa, gęsta oś
Hcz_dense = interp1(f, abs(Hcz_shifted), f_dense, 'spline');  % interpolacja modułu
Hcz_phase_dense = interp1(f, angle(Hcz_shifted)/pi, f_dense, 'spline'); % faza

% Rysowanie
figure(3);
    subplot(2,1,1);
        plot(f_dense, Hcz_dense); grid on;
        title("Interpolowany moduł |H(f)|");
        xlabel("Częstotliwość [Hz]");

    subplot(2,1,2);
        plot(f_dense, Hcz_phase_dense); grid on;
        title("Interpolowana faza ∠H(f) (w π rad)");
        xlabel("Częstotliwość [Hz]");
