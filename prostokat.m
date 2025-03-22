% Autor: Jakub Ploskonka
% 03 2025
% Funkcja prostokatna, impuls jednostkowy
% prostokat(czas/zakres, szerokosc impulsu, wysokosc impulsu)
% gdy chcemy przesuniecie wzgledem osi to (t + przesuniecie)

function prostokat = prostokat(t,width,height)

prostokat = zeros(size(t)); % daj wszedzie 0, chyba, ze t miesci sie w zakresie
prostokat (t >= -width/2 & t < width/2) = height;
end