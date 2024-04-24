function res = get_B11(t1,t2,t3,t4,t5,t6)
    res = cos(t2).^2.*4.991908526332e-2+cos(t3).^2.*1.662636067717e-2-cos(t5).^2.*1.84871004432e-3+cos(t6).^2.*5.8e-5+cos(t2).^2.*cos(t5).*8.953542576e-3+cos(t3).^2.*cos(t5).*8.953542576e-3+cos(t2).^2.*sin(t3).*4.03341436152e-2-cos(t2).^2.*cos(t3).^2.*3.325272135434e-2-cos(t2).^2.*cos(t4).^2.*1.88371004432e-3+cos(t2).^2.*cos(t5).^2.*1.84871004432e-3-cos(t3).^2.*cos(t4).^2.*1.88371004432e-3-cos(t2).^2.*cos(t6).^2.*1.16e-4+cos(t3).^2.*cos(t5).^2.*1.84871004432e-3-cos(t3).^2.*cos(t6).^2.*1.16e-4-cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*3.76742008864e-3-cos(t2).^2.*cos(t3).^2.*cos(t5).^2.*3.69742008864e-3+cos(t2).^2.*cos(t3).^2.*cos(t6).^2.*2.32e-4+cos(t2).^2.*cos(t4).^2.*cos(t5).^2.*1.84871004432e-3+cos(t2).^2.*cos(t4).^2.*cos(t6).^2.*5.8e-5+cos(t3).^2.*cos(t4).^2.*cos(t5).^2.*1.84871004432e-3+cos(t2).^2.*cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t3).^2.*cos(t4).^2.*cos(t6).^2.*5.8e-5+cos(t3).^2.*cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t2).^2.*cos(t5).*sin(t3).*1.0038820464e-2-cos(t2).^2.*cos(t3).^2.*cos(t5).*1.7907085152e-2+cos(t2).*cos(t3).*sin(t2).*4.03341436152e-2+cos(t2).^2.*cos(t3).*cos(t4).*sin(t5).*1.0038820464e-2-cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).^2.*3.69742008864e-3-cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*cos(t6).^2.*1.16e-4-cos(t2).^2.*cos(t3).^2.*cos(t5).^2.*cos(t6).^2.*1.16e-4+cos(t2).^2.*cos(t4).^2.*cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t3).^2.*cos(t4).^2.*cos(t5).^2.*cos(t6).^2.*5.8e-5+cos(t2).*cos(t3).*cos(t5).*sin(t2).*1.0038820464e-2+cos(t2).*cos(t3).*sin(t2).*sin(t3).*3.325272135434e-2-cos(t2).*cos(t4).*sin(t2).*sin(t5).*8.953542576e-3-cos(t3).*cos(t4).*sin(t3).*sin(t5).*8.953542576e-3-cos(t2).*cos(t3).*cos(t4).^2.*sin(t2).*sin(t3).*3.76742008864e-3+cos(t2).*cos(t3).*cos(t5).^2.*sin(t2).*sin(t3).*3.69742008864e-3-cos(t2).*cos(t3).*cos(t6).^2.*sin(t2).*sin(t3).*2.32e-4+cos(t2).*cos(t3).^2.*cos(t4).*sin(t2).*sin(t5).*1.7907085152e-2+cos(t2).^2.*cos(t3).*cos(t4).*sin(t3).*sin(t5).*1.7907085152e-2-cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).^2.*cos(t6).^2.*1.16e-4+cos(t2).*cos(t3).*cos(t5).*sin(t2).*sin(t3).*1.7907085152e-2-cos(t2).*cos(t4).*cos(t5).*sin(t2).*sin(t5).*3.69742008864e-3-cos(t3).*cos(t4).*cos(t5).*sin(t3).*sin(t5).*3.69742008864e-3-cos(t2).*cos(t4).*sin(t2).*sin(t3).*sin(t5).*1.0038820464e-2+cos(t2).*cos(t3).*cos(t4).^2.*cos(t5).^2.*sin(t2).*sin(t3).*3.69742008864e-3+cos(t2).*cos(t3).*cos(t4).^2.*cos(t6).^2.*sin(t2).*sin(t3).*1.16e-4+cos(t2).*cos(t3).*cos(t5).^2.*cos(t6).^2.*sin(t2).*sin(t3).*1.16e-4+cos(t2).*cos(t6).*sin(t2).*sin(t4).*sin(t5).*sin(t6).*1.16e-4+cos(t3).*cos(t6).*sin(t3).*sin(t4).*sin(t5).*sin(t6).*1.16e-4+cos(t2).*cos(t3).^2.*cos(t4).*cos(t5).*sin(t2).*sin(t5).*7.39484017728e-3+cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).*sin(t3).*sin(t5).*7.39484017728e-3-cos(t2).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t2).*sin(t5).*1.16e-4-cos(t3).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t3).*sin(t5).*1.16e-4-cos(t2).^2.*cos(t4).*cos(t5).*cos(t6).*sin(t4).*sin(t6).*1.16e-4-cos(t3).^2.*cos(t4).*cos(t5).*cos(t6).*sin(t4).*sin(t6).*1.16e-4+cos(t2).*cos(t3).^2.*cos(t4).*cos(t5).*cos(t6).^2.*sin(t2).*sin(t5).*2.32e-4+cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t3).*sin(t5).*2.32e-4+cos(t2).^2.*cos(t3).^2.*cos(t4).*cos(t5).*cos(t6).*sin(t4).*sin(t6).*2.32e-4+cos(t2).*cos(t3).*cos(t4).^2.*cos(t5).^2.*cos(t6).^2.*sin(t2).*sin(t3).*1.16e-4-cos(t2).*cos(t3).^2.*cos(t6).*sin(t2).*sin(t4).*sin(t5).*sin(t6).*2.32e-4-cos(t2).^2.*cos(t3).*cos(t6).*sin(t3).*sin(t4).*sin(t5).*sin(t6).*2.32e-4-cos(t2).*cos(t3).*cos(t4).*cos(t5).*cos(t6).*sin(t2).*sin(t3).*sin(t4).*sin(t6).*2.32e-4+2.43571004432e-3;

end