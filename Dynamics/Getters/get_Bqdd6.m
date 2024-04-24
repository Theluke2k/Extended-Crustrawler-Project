function res = get_Bqdd6(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
    res = tdd6.*9.0e-5+tdd4.*cos(t5).*9.0e-5+tdd2.*sin(t4).*sin(t5).*9.0e-5+tdd3.*sin(t4).*sin(t5).*9.0e-5-tdd1.*cos(t2).*cos(t3).*cos(t5).*9.0e-5+tdd1.*cos(t5).*sin(t2).*sin(t3).*9.0e-5+tdd1.*cos(t2).*cos(t4).*sin(t3).*sin(t5).*9.0e-5+tdd1.*cos(t3).*cos(t4).*sin(t2).*sin(t5).*9.0e-5;

end