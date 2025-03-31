function y = my_tri(t)

y = zeros(size(t));
% y(t==0) = 1;
y(t>=0 & t<1) = 1-t(t>=0 & t<1);
y(t<0 & t>-1) = 1+t(t<0 & t>-1);

