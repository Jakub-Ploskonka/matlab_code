% Autor: Jakub Ploskonka
% 03 2025
% Funkcja trojkatna
% trojkat(czas/zakres)
% gdy chcemy przesuniecie wzgledem osi to (t + przesuniecie)

function trojkat = trojkat(t)

trojkat = zeros(size(t));                       % daj wszedzie 0, chyba, ze t miesci sie w zakresie

% wartosci t mieszczace sie w szerokosci impulsu
n = abs(t) <= 1;
trojkat(n) = 1 * (1 - abs(t(n)));

end
