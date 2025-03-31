function n = norma(x,dt)
% n = norma(x,dt)
%
% M.Pawłowski; 
% Teoria Sygnałów, Elektronika AGH
% 28.01.2023
%
% funkcja oblicza normę wektora/funkcji określonej na dziedzinie t,
% która ma kolejne wartości w odstępach dt

n = sqrt(il_skalarny(x,x,dt));
end

% KONIEC FUNKCJI