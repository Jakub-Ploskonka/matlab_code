%My_odp_imp_2
function h = My_odp_imp_2(b,a,L)

h = zeros(1,L);
B = zeros(1,length(b));%Delta kroneckera
A = zeros(1,length(a)-1);%Poprzednie odpowiedzi systemu
B(1) = 1;

for n=1:L
   h(n) = sum(b.*B)-sum(a(2:end).*A);%b wsp przy x a przy y, przy drugim sum - bo y prenieśliśmy na drugą stronę
   B = [0,B(1:end-1)];%Przesunięcie delty
   A = [h(n),A(1:end-1)];%Przesunięcie odp systemu
end