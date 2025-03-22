% Autor: Jakub Ploskonka
% 03 2025
% Funkcja skok jednostkowy, 
% skok_jednostkowy(czas/zakres)
% gdy chcemy przesuniecie wzgledem osi to (t + przesuniecie)

function skok_jednostkowy = skok_jednostkowy(t)

skok_jednostkowy = zeros(size(t)); % daj wszedzie 0, chyba, ze t miesci sie w zakresie
skok_jednostkowy (t >= 0) = 1;
end