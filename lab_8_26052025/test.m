% licznik transmitancji systemu LTI
y=[4,0,-5,1];


% Funkcja tf2zpk(num, den) zamienia transmitancję (licznik i mianownik) na:
% z_y – zera systemu (pierwiastki licznika),
% p_y – bieguny systemu (pierwiastki mianownika),
% k_y – wzmocnienie (stały współczynnik przed transmitancją).

[z_y,p_y,k_y] = tf2zpk(y,3);

figure(1)
% Tworzy wykres punktów zer (z_y) w układzie rzeczywistym–urojonym (płaszczyzna zespolona)
    plot(real(z_y),imag(z_y)); hold on; grid on;
% wykres biegunów i zer:
    zplane(z_y,p_y);