% zadanie 3

fp=335;
fr=495;
fs=1800;
Rr=47;
Rp=2;

wp = 2*pi*fp;  
wr = 2*pi*fr;

A = acosh(sqrt((10^(Rr/10)-1)/(10^(Rp/10)-1)));
B = acosh(fr/fp);

N = ceil(A/B);

eps=sqrt(10^(Rp/10)-1);
r = sinh((1/N)*asinh(1/eps));
R = cosh((1/N)*asinh(1/eps));


poles = [];
for k = 1:N
    theta_k = pi*(2*k - 1)/(2*N);
    real_part = -wp * r * sin(theta_k);
    imag_part =  wp * R * cos(theta_k);
    p = real_part + 1j*imag_part;
    poles = [poles; p];
end

poles = poles(real(poles) < 0);


aa = poly(poles);   
ba = prod(-poles);  
ba = real(ba);


[Ha, Fa] = freqs(ba, aa, 2*pi* linspace(0,fs/2,100000));
iir_1;
iir_2;

ta=linspace(0,30e-3,1e3);
ha = PA_impulse(ba,aa,ta);

figure(4)
plot(ta,ha,'b'); hold on; grid on;

figure(5) % Wykresy zera-biegun
zplane([],poles); % Analogowy
grid

% met zach odp imp b1 a1 STAB
Ts=1/fs;

[r,p,K] = residue(b,a);
licznik = Ts*r;
mianownik = exp(Ts*p);

[b1,a1] = residue(licznik,mianownik,K);
b1 = real(b1);

Q = 4096;

[H1, F1] = freqz(b1,a1,Q,fs);
iir_3;

[h1 t1] = impz(b1,a1,max(ta) * fs,fs);

figure(4) 
    stem(t1, h1*fs, 'rx'); hold on; grid on;


% transformacja biliniowa b2 a2 STAB

for k = 1 : length(poles)
    pd(k) = (1 + poles(k)*Ts/2) / (1-poles(k) * Ts/2);
end
            

zd = -ones(N,1);

kd = ka*(prod(2*fs-za))/(prod(2*fs-poles));

[b2, a2] = zp2tf(zd,pd,kd);


[H2, F2] = freqz(b2,a2,4096,fs);

iir_4;

[h2 t2]=impz(b2,a2,max(ta)*fs,fs);

figure(4); hold on;
stem(t2, h2*fs,'gx')
















