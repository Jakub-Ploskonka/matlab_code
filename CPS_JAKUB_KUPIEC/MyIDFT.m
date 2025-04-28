%MyIDFT
function x=MyIDFT(X)
N=length(X);
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
x=A^(-1)*X;
end