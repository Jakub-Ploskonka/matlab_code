%ZTransform
function Z = ZTransform(x,Xreal,Yreal)
N=length(x);
[X,Y]=meshgrid(Xreal,Yreal);
z=X+j*Y;
Z=zeros(length(z(1,:)),length(z(:,1)));
    for k=1:length(z(1,:))
        for l=1:length(z(:,1))
            for i=1:N
                Z(k,l)=Z(k,l)+x(i)*z(k,l)^(-(i-3));
            end
        end
    end
    figure(5)
        mesh(X,Y,20*log10(abs(Z)));
        grid on;
end
    