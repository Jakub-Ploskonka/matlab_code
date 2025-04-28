%t=-1:0.01:1;
%S=1/4*(1+2*cos(pi*t)+2*j*sin(pi*t)+cos(2*pi*t)-j*sin(2*pi*t));

%figure(1)
%    plot(t,abs(S),'b-'); hold on;
%    plot(t,angle(S),'r-'); hold on;

X=[0,-2,0,-2,0,-2,0,-2];
x=ifft(X)