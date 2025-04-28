%odpimpf
function[H,f]=odpimpf(b,a,N,fs)
odp=conv(a,b);
H=fft(odp,N);

%n=length(H);
f=0:fs/N:fs-fs/N;
figure(10)
 subplot(2,1,1)
 plot(f,20*log10(abs(H)));grid on; hold on;
 %plot(f,abs(H));grid on; hold on;
 xlim([0 fs/2]);
 title('Magnituda');
 subplot(2,1,2)
 plot(f,unwrap(angle(H)));grid on; hold on;
 title('Faza');
 xlim([0 fs/2]);
end