function res = get_B42(t1,t2,t3,t4,t5,t6)
    res = sin(t5).*(sin(t4).*4.032317100891947e+27+cos(t5).*sin(t4).*1.665169973343129e+27+sin(t3).*sin(t4).*4.521082810090971e+27+cos(t5).*cos(t6).^2.*sin(t4).*5.224175567749776e+25+cos(t4).*cos(t6).*sin(t6).*5.224175567749776e+25).*(-1.110223024625157e-30);

end