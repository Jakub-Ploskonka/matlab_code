% Autor: Jakub Ploskonka
% 03 2025
% Funkcja trojkatna
% trojkat(czas/zakres, szerokosc impulsu, wysokosc impulsu)
% gdy chcemy przesuniecie wzgledem osi to (t + przesuniecie)

function trojkat = trojkat(t,width,height)

trojkat = zeros(size(t));                       % daj wszedzie 0, chyba, ze t miesci sie w zakresie

% wartosci t mieszczace sie w szerokosci impulsu
n = abs(t) <= width/2;
trojkat(n) = height * (1 - abs(t(n)) / (width/2));

end