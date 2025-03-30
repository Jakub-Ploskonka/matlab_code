function x=xPI(t,T,pos)
    N=length(t);
    x=zeros(1,N);
    x((t>=(pos-T/2))&(t<=(pos+T/2))) = 1;
end