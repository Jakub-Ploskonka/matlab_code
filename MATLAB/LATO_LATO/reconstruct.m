function [s_r] = reconstruct(s, t, t_p, fs)


dTs = 1/fs;
N = length(s);

s_r = zeros(1, length(t)); 

for n = 1:N
    s_r = s_r + s(n) * sinc(fs *(t - t_p(n)));
end

end

