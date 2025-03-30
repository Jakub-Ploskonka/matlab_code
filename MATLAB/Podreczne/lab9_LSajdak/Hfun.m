function M = Hfun(b,a,N)
% podajesz współczynniki przed przeniesieniem

a(2) = -a(2);
a(3) = -a(3);

M = zeros(1,N);

% warunki początkowe
M(1) = 1*b(1);    % impuls jednostkowy
M(2) = 1*b(2)+M(1)*a(2);
M(3) = 1*b(3)+M(1)*a(3)+M(2)*a(2);

for i = 4:N
    M(i) = M(i-1)*a(2)+M(i-2)*a(3);

end

M = M/a(1);

end