function [S, f, t] = my_spectrogram(x, do, no, nfft, fs)
    N = length(x); % Obliczenie długości sygnału
    w=hamming(do).*2; % Obliczanie okna
    ns = fix((N-no)/(do-no)); % Obliczenie liczby kroków
    df=(nfft/2)+1; % krok czestotliwosci
    
    S = zeros(df, ns);
    
    % Obliczenie wektorów częstotliwości i czasu
    f = linspace(0, fs/2, df);
    t = (do/2:ns:do/2+(ns-1)*(do-no))/fs;
    
    % Pętla po krokach
    for k = 1:ns
        % Wycinanie fragmentu sygnału
        xo = x((k-1)*(do-no)+1:(k-1)*(do-no)+do);
        
        % Stosowanie okna
        xo = xo.*w;
        
        % Oblicz transformatę Fouriera
        Xo = fft(xo);
        
        % Zapisz amplitudę spektrum do macierzy spektrogramu
        S(:, k) = abs(Xo(1:df));
    end
end