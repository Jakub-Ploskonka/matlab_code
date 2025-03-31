function c=calka(x,dt);
% c=calka(x,dt);
%
% Teoria sygnalow
% Elektronika
% AGH
%
% Metoda trapezow;
% dt - odstep na osi zmiennej niezaleznej (zakladamy staly odstep miedzy probkami!); 
% x - wektor wartosci funkcji w odstepach "dt", na calkowanym przedziale;
%
% P.Korohoda; 

	c=[sum(x(2:end-1))+0.5*(x(1)+x(end))]*dt;

% KONIEC FUNKCJI;