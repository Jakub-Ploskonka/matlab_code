function y = my_pi(t)

% y = zeros(size(t)) + 1;
y = zeros(size(t)) + 1;
y(t>0.5) = 0;
y(t<-0.5) = 0;
y(t==0.5) = 0.5;
y(t==-0.5) = 0.5;

