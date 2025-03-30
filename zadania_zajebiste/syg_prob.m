function x=syg_do_prob(k,f0,fs)
    T=(2*k)/f0;
    t=linspace(-T,T,1000);
    x=sin(2*pi*f0*t).*xPI(t,T,0);

    figure(1)
        plot(t,x,"b"); grid on; hold on;

    ts=min(t):1/fs:max(t);
    x=sin(2*pi*f0*ts).*xPI(ts,T,0);
    stem(ts,x);
end