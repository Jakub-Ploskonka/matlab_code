function x=syg_odt(k,f0,fs)
    T=(2*k)/f0;
    t=linspace(-T,T,1000);
    x=sin(2*pi*f0*t).*xPI(t,T,0);

    figure(1)
        plot(t,x,"b",'LineWidth',2); grid on; hold on;

    ts=min(t):1/fs:max(t);
    x=sin(2*pi*f0*ts).*xPI(ts,T,0);
        stem(ts,x); hold on;
    
        y=0;
        for i=1:length(ts)
            y=y+x(i).*sinc((t-ts(i))*fs);
        end

        plot(t,y,"g", "LineWidth", 2);
end