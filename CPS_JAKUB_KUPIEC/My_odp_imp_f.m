function [H,f] = My_odp_imp_f(b,a,N,fs)
f=0:fs/N:fs-fs/N;
H=zeros(N,1);
for i=1:N
    for n=1:length(b)
        H(i)=H(i)+b(n)*exp(-1j*2*pi*f(i)*(n-1)/fs);
    end
    for m=1:length(a)
       H(i)=H(i)+a(m)*exp(-1j*2*pi*f(i)*(m-1)/fs);
    end
end
H=H/a(1);
figure(10)
 subplot(2,1,1)
 plot(f,20*log10(abs(H)));grid on; hold on;
 title('Magnituda');
 subplot(2,1,2)
 plot(f,unwrap(angle(H)));grid on; hold on;
 title('Faza');


end