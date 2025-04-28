function y = xpi(t)
y(t<1/2 & t>-1/2) = 1;
y(t>1/2 | t<-1/2) = 0;
end