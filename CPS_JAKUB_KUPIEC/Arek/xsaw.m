function y=xsaw(t)
    y = zeros(length(t));
    y(t>0 & t<1) = t(t>0 & t<1);
end