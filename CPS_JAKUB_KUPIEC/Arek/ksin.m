function y=ksin(t,k,f0)
f0=f0/1000;
y=sin(2*pi*f0*t);
y(t>k/f0) = 0;
y((t<-k/f0)) = 0;
end