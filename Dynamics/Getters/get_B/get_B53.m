function res = get_B53(t1,t2,t3,t4,t5,t6)
    res = cos(t4).*2.26271004432e-3+cos(t4).*cos(t5).*4.476771288e-3-cos(t4).*cos(t6).^2.*5.8e-5+cos(t5).*cos(t6).*sin(t4).*sin(t6).*5.8e-5;

end