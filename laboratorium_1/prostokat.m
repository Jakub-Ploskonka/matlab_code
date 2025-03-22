% Autor: Jakub Ploskonka
% 03 2025
% Funkcja prostokatna, impuls jednostkowy
% prostokat(czas/zakres)
% gdy chcemy przesuniecie wzgledem osi to (t + przesuniecie)

function prostokat = prostokat(t)

prostokat = zeros(size(t)); % daje wszedzie 0, chyba, ze t miesci sie w zakresie
prostokat (t >= -1/2 & t < 1/2) = 1;
end