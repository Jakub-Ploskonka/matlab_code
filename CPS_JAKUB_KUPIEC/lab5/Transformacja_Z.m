%Transformacja Z
clc; close all; clear;
%Sygnał z wykładu
N=4;
x=[2,1,-1,3];

dz=0.1;
[X,Y]=meshgrid(-4:dz:4,-4:dz:4);
z=X+j*Y;
Z=zeros(length(z(1,:)),length(z(:,1)));
    for k=1:length(z(1,:))
        for l=1:length(z(:,1))
            for i=1:N
                Z(k,l)=Z(k,l)+x(i)*z(k,l)^(-(i-3));
            end
        end
    end

    figure(1)
        mesh(X,Y,abs(Z));
        grid on;