%MyDFTV1
function X=MyDFTV1(x,k,n)
N=length(x);
w=exp(-1j*2*pi/N);
A=w.^(k(:)*n);
X=A*x(:);
end