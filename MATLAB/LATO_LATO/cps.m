%Wyświetl spektrogram
figure(1)
    imagesc(t, f, 20*log10(abs(s)));
    axis xy; % Inwersja osi Y
    xlabel('Czas [s]');
    ylabel('Częstotliwość [Hz]');
    title('Spektrogram (moja funkcja)');
    colorbar; % Dodanie kolorowej skali 
