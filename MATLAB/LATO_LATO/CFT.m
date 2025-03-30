function [S] = CFT(s, f, t, dt)

Nf = length(f);
N = length(s);

S = zeros(1, Nf);

for k = 1:length(f)
    for n = 1:N
        S(k) = S(k) + s(n) * exp(-1i*2*pi*f(k)*t(n)) * dt;
    end
end

end

