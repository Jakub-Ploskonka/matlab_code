function iloczyn = il_skalarny(x,y,dt)
% iloczyn = il_skalarny(x,y,dt)
%
% M.Pawłowski; 
% Teoria Sygnałów, Elektronika AGH
% 28.01.2023
%
% funkcja wylicza iloczyn skalarny 2 wektorów/funkcji określonych na
% dziedzinie t, która ma kolejne wartości w odstępach dt

iloczyn=calka(x.*conj(y),dt);
end

% KONIEC FUNKCJI