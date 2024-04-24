function res = get_B16(t1,t2,t3,t4,t5,t6)
    res = cos(t5).*sin(t2).*sin(t3).*9.0e-5-cos(t2).*cos(t3).*cos(t5).*9.0e-5+cos(t2).*cos(t4).*sin(t3).*sin(t5).*9.0e-5+cos(t3).*cos(t4).*sin(t2).*sin(t5).*9.0e-5;

end