function res = get_B32(t1,t2,t3,t4,t5,t6)
    res = cos(t5).*8.953542576e-3+sin(t3).*2.01670718076e-2+cos(t5).*sin(t3).*5.019410232e-3+cos(t4).^2.*1.88371004432e-3+cos(t5).^2.*1.84871004432e-3-cos(t4).^2.*cos(t5).^2.*1.84871004432e-3-cos(t4).^2.*cos(t6).^2.*5.8e-5+cos(t5).^2.*cos(t6).^2.*5.8e-5-cos(t4).^2.*cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t3).*cos(t4).*sin(t5).*5.019410232e-3+cos(t4).*cos(t5).*cos(t6).*sin(t4).*sin(t6).*1.16e-4+1.703336067717e-2;

end