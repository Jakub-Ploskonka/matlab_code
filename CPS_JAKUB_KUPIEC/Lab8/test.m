y=[4,0,-5,1];

[z_y,p_y,k_y]=tf2zpk(y,3);

figure(1)
    plot(real(z_y),imag(z_y)); hold on; grid on;
    zplane(z_y,p_y);