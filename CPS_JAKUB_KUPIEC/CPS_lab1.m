%Sin o okresie 1/f0 i szerokości 2k
function y=CPS_lab1(t,f0,k)
y1=sin(2*pi*f0*t);
y2=zeros(1,length(t));
y2(abs(t)<(k/f0))=1;
y=y1.*y2;
end