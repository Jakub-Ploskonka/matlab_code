function y = XPI(x)
y = zeros(size(x));
y(abs(x)<1/2)=1;
y(abs(x)==1/2)=1/2;