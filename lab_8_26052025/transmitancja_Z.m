%Transformacja Z
clc; close all; clear;
%Sygnał z wykładu
N = 4; % długość sygnału
x = [2,1,-1,3]; % sygnał dyskretny (4 próbki)

dz = 0.1;
[X,Y] = meshgrid(-4 : dz : 4, -4 : dz : 4); % Tworzy siatkę punktów w płaszczyźnie zespolonej (re{z} i im{z} od -4 do 4 co 0.1
z = X+j*Y;

% Obliczanie Z-transformacji
Z = zeros(length(z(1,:)), length(z(:,1)));

    for k = 1 : length(z(1,:))
        for l = 1 : length(z(:,1))
            for i = 1 : N
                Z(k,l)=Z(k,l)+x(i)*z(k,l)^(-(i-3));
            end
        end
    end

% Przekształcenie wartości do formatu dB i rysowanie wykresu
Znew = 20 * log10(abs(Z));

    figure(1)
        mesh(X,Y,Znew);
        grid on;