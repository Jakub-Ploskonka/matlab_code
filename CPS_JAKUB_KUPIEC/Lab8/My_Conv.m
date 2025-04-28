%My_Conv
function splot = My_Conv(h,x)

M = length(h);
N = length(x);
K = N+M-1;

splot = zeros(1,K);
hk = [h,zeros(1,N-1)];
xk = [x,zeros(1,M-1)];

for m=1:K
       splot = splot + xk(m)*hk;
       hk = [0,hk(1:end-1)];
end
end