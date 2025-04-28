%MySTFT
function [S, f, t] = MySTFT(x, fs, window_length, overlap)
    % Parametry STFT
    nfft = 2^nextpow2(window_length);
    hop_size = window_length - overlap;

    % Inicjalizacja wyników
    num_segments = floor((length(x) - overlap) / hop_size);
    S = zeros(nfft / 2 + 1, num_segments);
    t = zeros(1, num_segments);

    % Oblicz STFT
    for i = 1:num_segments
        start_idx = (i - 1) * hop_size + 1;
        end_idx = start_idx + window_length - 1;
        segment = x(start_idx:end_idx);

        % Okno Hamminga
        window = hamming(window_length);
        segment = segment .* window;

        % Oblicz FFT
        X = fft(segment, nfft);
        S(:, i) = abs(X(1:nfft / 2 + 1));

        % Czas
        t(i) = start_idx / fs;
    end

    % Częstotliwości
    f = linspace(0, fs / 2, nfft / 2 + 1);
end