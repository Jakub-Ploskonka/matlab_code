function [t,sa] = odt(x,fs)
% funkcja odtwarza sygnał z próbek za pomocą funkcji sinc
% t - pseudo-ciągły czas
% x - próbki sygnału
% fs - częstotliwość próbkowania

N = length(x); % liczba próbek
T_samp = 1/fs;
t = linspace(0,(N-1)*T_samp,50*N);

sa = zeros(size(t));
for i=0:N-1
    sa = sa + x(i+1).*sinc((t-i*T_samp)./T_samp);
end

end