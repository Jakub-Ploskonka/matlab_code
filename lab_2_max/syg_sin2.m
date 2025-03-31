function [t,s,ts,x] = syg_sin2(k,f0,fs)
tmax = 1/(f0)*(k+1);
dt = tmax/1e5;
t = -tmax:dt:tmax;
s = sin(2*pi*f0.*t);
okno = my_pi(t/(2*k/f0));
s = s .* okno;

T_samp = 1/fs;
ts = -tmax:T_samp:tmax;
x = zeros([1,length(ts)]);

for i=1:length(ts)
    nowe_t = ts(i);
    x(i) = sin(2*pi*f0*nowe_t) * my_pi(nowe_t/(2*k/f0));
end

% sa =[];
% for i=1:il_sampli+1
%     sa = sa + x(i).*sinc(t*)
% end
end