function Cx=xintegral(fx,dx);
	Cx=[sum(fx(2:end-1))+0.5*(fx(1)+fx(end))]*dx;
end