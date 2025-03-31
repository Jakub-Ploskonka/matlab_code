f0 = 1000; % Hz - częstotliwość sygnału
fs_range = 100:50:3000; % zakres fs od 100 Hz do 3000 Hz
f_alias_list = zeros(size(fs_range));

for i = 1:length(fs_range)
    fs = fs_range(i);
    % Oblicz aliasing zgodnie z zasadą Nyquista
    f_alias = abs(f0 - round(f0/fs)*fs);
    f_alias_list(i) = f_alias;
end

% Wykres
figure;
plot(fs_range, f_alias_list, 'b', 'LineWidth', 2);
xlabel('Częstotliwość próbkowania f_s [Hz]');
ylabel('Aliasowana częstotliwość [Hz]');
title('Aliasowanie sygnału o f_0 = 1000 Hz');
grid on;
hold on;

% Podświetlenie dla fs = 870 i fs = 1300
special_fs = [870, 1300];
for i = 1:length(special_fs)
    fs_val = special_fs(i);
    f_alias_val = abs(f0 - round(f0/fs_val)*fs_val);
    plot(fs_val, f_alias_val, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
    text(fs_val + 20, f_alias_val + 10, ...
        sprintf('fs = %d Hz\nalias = %.0f Hz', fs_val, f_alias_val), ...
        'Color', 'red');
end






f0 = 1000; % Hz
fs1 = 870; 
fs2 = 1300;
fmax = 4000; % maksymalna częstotliwość na wykresie
k_range = -4:4; % liczba replik

% Przygotowanie widm
f_axis = -fmax:1:fmax;

figure;
hold on; grid on;

% Oryginalne widmo (analogowe)
stem([-f0 f0], [1 1], 'k', 'LineWidth', 2, 'DisplayName', 'Oryginalne widmo f_0=1000Hz');

% Widmo po próbkowaniu fs1
for k = k_range
    f1 = k*fs1 + f0;
    f2 = k*fs1 - f0;
    stem([f1 f2], [0.7 0.7], 'r', 'LineWidth', 1.5, 'DisplayName', 'fs = 870 Hz'*(k==0));
end

% Widmo po próbkowaniu fs2
for k = k_range
    f1 = k*fs2 + f0;
    f2 = k*fs2 - f0;
    stem([f1 f2], [0.4 0.4], 'b', 'LineWidth', 1.5, 'DisplayName', 'fs = 1300 Hz'*(k==0));
end

xlim([-fmax fmax])
ylim([0 1.2])
xlabel('Częstotliwość [Hz]')
ylabel('Amplituda (umowna)')
title('Widmo sygnału sinusoidalnego i jego aliasy po próbkowaniu')
legend('Location', 'northeast')

