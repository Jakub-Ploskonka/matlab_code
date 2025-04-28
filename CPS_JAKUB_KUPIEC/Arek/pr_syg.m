function s = pr_syg(t,k,f0)
s = sin(2*3.14*f0*t);
s(t>k/f0) = 0;
s(t<-k/f0) = 0;
end