function [y, n] = sam(s, t, f0, fs)
    T = 1/fs;
    n = t(1):T:t(end);
    k = round(length(t)/length(n));
    dk = ones(length(n));
    m(1) = s(1);
    for z=1:length(n)-1
        m(z+1) = s((z*k+z)+1);
    end
    %dk(abs(mod(t, 1/7)) < ((t(end)-t(1))/length(t))) =1;
    y = m;
end