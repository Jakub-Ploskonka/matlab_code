%MyIDFTV1
function x=MyIDFTV1(X,k,n)
N=length(X);
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
x=A^(-1)*X;
end