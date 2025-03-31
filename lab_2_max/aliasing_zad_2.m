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
