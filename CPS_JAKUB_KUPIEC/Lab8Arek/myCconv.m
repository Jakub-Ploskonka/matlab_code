function spKol = myCconv(h,x)
    M = length(h);
    N = length(x);
    K = N+M-1;
    
    X = fft(x,K);
    H = fft(h,K);
    spKol = ifft(X.*H);
end