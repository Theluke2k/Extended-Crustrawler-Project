function res = get_Cqd5(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
    res = td2.^2.*sin(t5).*4.476771288e-3+td3.^2.*sin(t5).*4.476771288e-3-td1.^2.*sin(t5.*2.0).*9.2435502216e-4+td2.^2.*sin(t5.*2.0).*9.2435502216e-4+td3.^2.*sin(t5.*2.0).*9.2435502216e-4-td4.^2.*sin(t5.*2.0).*9.2435502216e-4+td2.^2.*sin(t3).*sin(t5).*5.019410232e-3+td2.*td3.*sin(t5).*8.953542576e-3-td2.*td4.*sin(t4).*4.11142008864e-3-td3.*td4.*sin(t4).*4.11142008864e-3+td4.*td6.*sin(t5).*1.48e-4+td1.^2.*cos(t2).^2.*sin(t5).*4.476771288e-3+td1.^2.*cos(t3).^2.*sin(t5).*4.476771288e-3+td2.*td3.*sin(t5.*2.0).*1.84871004432e-3+td5.*td6.*sin(t6.*2.0).*5.8e-5-td2.*td6.*cos(t5).*sin(t4).*1.48e-4-td3.*td6.*cos(t5).*sin(t4).*1.48e-4+td1.^2.*cos(t2).^2.*cos(t5).*sin(t5).*1.84871004432e-3+td1.^2.*cos(t3).^2.*cos(t5).*sin(t5).*1.84871004432e-3-td2.^2.*cos(t4).^2.*cos(t5).*sin(t5).*1.84871004432e-3-td1.^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5-td3.^2.*cos(t4).^2.*cos(t5).*sin(t5).*1.84871004432e-3+td2.^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td3.^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5-td4.^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td1.^2.*cos(t2).^2.*sin(t3).*sin(t5).*5.019410232e-3+td2.*td4.*cos(t5).^2.*sin(t4).*3.69742008864e-3+td3.*td4.*cos(t5).^2.*sin(t4).*3.69742008864e-3-td4.*td6.*cos(t6).^2.*sin(t5).*1.16e-4-td1.^2.*cos(t2).^2.*cos(t3).^2.*sin(t5).*8.953542576e-3-td2.^2.*cos(t3).*cos(t4).*cos(t5).*5.019410232e-3-td1.^2.*cos(t2).*cos(t4).*sin(t2).*1.84871004432e-3-td1.^2.*cos(t3).*cos(t4).*sin(t3).*1.84871004432e-3+td1.^2.*cos(t2).*cos(t3).^2.*cos(t4).*sin(t2).*3.69742008864e-3+td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*sin(t3).*3.69742008864e-3+td1.^2.*cos(t2).*cos(t4).*cos(t5).^2.*sin(t2).*3.69742008864e-3-td1.^2.*cos(t2).*cos(t4).*cos(t6).^2.*sin(t2).*5.8e-5+td1.^2.*cos(t3).*cos(t4).*cos(t5).^2.*sin(t3).*3.69742008864e-3-td1.^2.*cos(t3).*cos(t4).*cos(t6).^2.*sin(t3).*5.8e-5-td2.*td3.*cos(t4).^2.*cos(t5).*sin(t5).*3.69742008864e-3+td2.*td3.*cos(t5).*cos(t6).^2.*sin(t5).*1.16e-4+td2.*td6.*cos(t5).*cos(t6).^2.*sin(t4).*1.16e-4+td3.*td6.*cos(t5).*cos(t6).^2.*sin(t4).*1.16e-4-td1.^2.*cos(t2).^2.*cos(t3).^2.*cos(t5).*sin(t5).*3.69742008864e-3+td1.^2.*cos(t2).^2.*cos(t4).^2.*cos(t5).*sin(t5).*1.84871004432e-3+td1.^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).*sin(t5).*1.84871004432e-3+td1.^2.*cos(t2).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td1.^2.*cos(t3).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5-td2.^2.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5-td3.^2.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td2.*td4.*cos(t5).^2.*cos(t6).^2.*sin(t4).*1.16e-4+td3.*td4.*cos(t5).^2.*cos(t6).^2.*sin(t4).*1.16e-4+td1.^2.*cos(t2).*cos(t4).*cos(t5).*sin(t2).*4.476771288e-3+td1.^2.*cos(t3).*cos(t4).*cos(t5).*sin(t3).*4.476771288e-3+td1.^2.*cos(t2).*cos(t3).*sin(t2).*sin(t5).*5.019410232e-3-td1.*td2.*cos(t2).*cos(t3).*sin(t4).*4.14e-4-td1.*td3.*cos(t2).*cos(t3).*sin(t4).*4.14e-4-td1.*td4.*cos(t2).*cos(t4).*sin(t3).*4.11142008864e-3-td1.*td4.*cos(t3).*cos(t4).*sin(t2).*4.11142008864e-3-td1.*td6.*cos(t2).*cos(t3).*sin(t5).*1.48e-4+td2.*td6.*cos(t4).*cos(t6).*sin(t6).*1.16e-4+td3.*td6.*cos(t4).*cos(t6).*sin(t6).*1.16e-4+td1.*td2.*cos(t5).*sin(t2).*sin(t4).*1.0038820464e-2-td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).*5.019410232e-3+td1.*td2.*sin(t2).*sin(t3).*sin(t4).*4.14e-4+td1.*td3.*sin(t2).*sin(t3).*sin(t4).*4.14e-4+td1.*td6.*sin(t2).*sin(t3).*sin(t5).*1.48e-4-td1.*td2.*cos(t2).*cos(t3).*cos(t5).^2.*sin(t4).*3.69742008864e-3+td1.*td2.*cos(t2).*cos(t3).*cos(t6).^2.*sin(t4).*1.16e-4-td1.*td3.*cos(t2).*cos(t3).*cos(t5).^2.*sin(t4).*3.69742008864e-3+td1.*td3.*cos(t2).*cos(t3).*cos(t6).^2.*sin(t4).*1.16e-4+td1.*td4.*cos(t2).*cos(t4).*cos(t5).^2.*sin(t3).*3.69742008864e-3+td1.*td4.*cos(t3).*cos(t4).*cos(t5).^2.*sin(t2).*3.69742008864e-3+td1.*td6.*cos(t2).*cos(t3).*cos(t6).^2.*sin(t5).*1.16e-4+td1.*td2.*cos(t5).^2.*sin(t2).*sin(t3).*sin(t4).*3.69742008864e-3-td1.*td2.*cos(t6).^2.*sin(t2).*sin(t3).*sin(t4).*1.16e-4+td1.*td3.*cos(t5).^2.*sin(t2).*sin(t3).*sin(t4).*3.69742008864e-3-td1.*td3.*cos(t6).^2.*sin(t2).*sin(t3).*sin(t4).*1.16e-4-td1.*td6.*cos(t6).^2.*sin(t2).*sin(t3).*sin(t5).*1.16e-4-td1.^2.*cos(t2).*cos(t3).^2.*cos(t4).*cos(t5).^2.*sin(t2).*7.39484017728e-3+td1.^2.*cos(t2).*cos(t3).^2.*cos(t4).*cos(t6).^2.*sin(t2).*1.16e-4-td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).^2.*sin(t3).*7.39484017728e-3+td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*cos(t6).^2.*sin(t3).*1.16e-4+td1.^2.*cos(t2).*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t2).*1.16e-4+td1.^2.*cos(t3).*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t3).*1.16e-4-td2.*td3.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*1.16e-4+td1.^2.*cos(t2).*cos(t4).*cos(t5).*sin(t2).*sin(t3).*5.019410232e-3-td1.^2.*cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).*sin(t5).*3.69742008864e-3-td1.^2.*cos(t2).^2.*cos(t3).^2.*cos(t5).*cos(t6).^2.*sin(t5).*1.16e-4+td1.^2.*cos(t2).^2.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td1.^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*5.8e-5+td1.^2.*cos(t2).*cos(t3).*sin(t2).*sin(t3).*sin(t5).*8.953542576e-3+td2.^2.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*5.8e-5+td3.^2.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*5.8e-5-td1.*td2.*cos(t2).*cos(t3).*cos(t5).*sin(t4).*8.953542576e-3-td1.*td3.*cos(t2).*cos(t3).*cos(t5).*sin(t4).*8.953542576e-3+td1.*td4.*cos(t2).*cos(t3).*cos(t5).*sin(t5).*3.69742008864e-3-td1.*td6.*cos(t2).*cos(t4).*cos(t5).*sin(t3).*1.48e-4-td1.*td6.*cos(t3).*cos(t4).*cos(t5).*sin(t2).*1.48e-4+td2.*td4.*cos(t4).*cos(t5).*cos(t6).*sin(t6).*1.16e-4+td3.*td4.*cos(t4).*cos(t5).*cos(t6).*sin(t6).*1.16e-4+td1.*td2.*cos(t5).*sin(t2).*sin(t3).*sin(t4).*8.953542576e-3+td1.*td3.*cos(t5).*sin(t2).*sin(t3).*sin(t4).*8.953542576e-3-td1.*td4.*cos(t5).*sin(t2).*sin(t3).*sin(t5).*3.69742008864e-3-td1.^2.*cos(t2).*cos(t3).^2.*cos(t4).*cos(t5).*sin(t2).*8.953542576e-3-td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).*sin(t3).*8.953542576e-3-td1.*td4.*cos(t5).*cos(t6).^2.*sin(t2).*sin(t3).*sin(t5).*1.16e-4-td1.*td2.*cos(t2).*cos(t3).*cos(t5).^2.*cos(t6).^2.*sin(t4).*1.16e-4-td1.*td3.*cos(t2).*cos(t3).*cos(t5).^2.*cos(t6).^2.*sin(t4).*1.16e-4+td1.*td4.*cos(t2).*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t3).*1.16e-4+td1.*td4.*cos(t3).*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t2).*1.16e-4+td1.*td2.*cos(t5).^2.*cos(t6).^2.*sin(t2).*sin(t3).*sin(t4).*1.16e-4+td1.*td3.*cos(t5).^2.*cos(t6).^2.*sin(t2).*sin(t3).*sin(t4).*1.16e-4-td1.^2.*cos(t2).*cos(t3).^2.*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t2).*2.32e-4-td1.^2.*cos(t2).^2.*cos(t3).*cos(t4).*cos(t5).^2.*cos(t6).^2.*sin(t3).*2.32e-4+td1.^2.*cos(t2).*cos(t3).*cos(t5).*sin(t2).*sin(t3).*sin(t5).*3.69742008864e-3-td1.^2.*cos(t2).*cos(t5).*cos(t6).*sin(t2).*sin(t4).*sin(t6).*5.8e-5-td1.^2.*cos(t3).*cos(t5).*cos(t6).*sin(t3).*sin(t4).*sin(t6).*5.8e-5-td1.*td2.*cos(t2).*cos(t6).*sin(t3).*sin(t5).*sin(t6).*1.16e-4-td1.*td2.*cos(t3).*cos(t6).*sin(t2).*sin(t5).*sin(t6).*1.16e-4-td1.*td3.*cos(t2).*cos(t6).*sin(t3).*sin(t5).*sin(t6).*1.16e-4-td1.*td3.*cos(t3).*cos(t6).*sin(t2).*sin(t5).*sin(t6).*1.16e-4-td1.*td6.*cos(t2).*cos(t6).*sin(t3).*sin(t4).*sin(t6).*1.16e-4-td1.*td6.*cos(t3).*cos(t6).*sin(t2).*sin(t4).*sin(t6).*1.16e-4+td2.*td3.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*1.16e-4-td1.^2.*cos(t2).^2.*cos(t3).^2.*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t5).*1.16e-4-td1.^2.*cos(t2).^2.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*5.8e-5-td1.^2.*cos(t3).^2.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*5.8e-5+td1.*td4.*cos(t2).*cos(t3).*cos(t5).*cos(t6).^2.*sin(t5).*1.16e-4+td1.*td6.*cos(t2).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t3).*1.16e-4+td1.*td6.*cos(t3).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t2).*1.16e-4+td1.^2.*cos(t2).^2.*cos(t3).^2.*cos(t4).*cos(t6).*sin(t4).*sin(t5).*sin(t6).*1.16e-4+td1.*td2.*cos(t2).*cos(t4).*cos(t5).*sin(t3).*sin(t4).*sin(t5).*3.69742008864e-3+td1.*td2.*cos(t3).*cos(t4).*cos(t5).*sin(t2).*sin(t4).*sin(t5).*3.69742008864e-3+td1.*td3.*cos(t2).*cos(t4).*cos(t5).*sin(t3).*sin(t4).*sin(t5).*3.69742008864e-3+td1.*td3.*cos(t3).*cos(t4).*cos(t5).*sin(t2).*sin(t4).*sin(t5).*3.69742008864e-3-td1.*td4.*cos(t2).*cos(t5).*cos(t6).*sin(t3).*sin(t4).*sin(t6).*1.16e-4-td1.*td4.*cos(t3).*cos(t5).*cos(t6).*sin(t2).*sin(t4).*sin(t6).*1.16e-4+td1.^2.*cos(t2).*cos(t3).*cos(t4).^2.*cos(t5).*sin(t2).*sin(t3).*sin(t5).*3.69742008864e-3+td1.^2.*cos(t2).*cos(t3).*cos(t5).*cos(t6).^2.*sin(t2).*sin(t3).*sin(t5).*1.16e-4+td1.^2.*cos(t2).*cos(t3).^2.*cos(t5).*cos(t6).*sin(t2).*sin(t4).*sin(t6).*1.16e-4+td1.^2.*cos(t2).^2.*cos(t3).*cos(t5).*cos(t6).*sin(t3).*sin(t4).*sin(t6).*1.16e-4+td1.*td2.*cos(t2).*cos(t4).^2.*cos(t6).*sin(t3).*sin(t5).*sin(t6).*1.16e-4+td1.*td2.*cos(t3).*cos(t4).^2.*cos(t6).*sin(t2).*sin(t5).*sin(t6).*1.16e-4+td1.*td3.*cos(t2).*cos(t4).^2.*cos(t6).*sin(t3).*sin(t5).*sin(t6).*1.16e-4+td1.*td3.*cos(t3).*cos(t4).^2.*cos(t6).*sin(t2).*sin(t5).*sin(t6).*1.16e-4+td1.*td2.*cos(t2).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t3).*sin(t4).*sin(t5).*1.16e-4+td1.*td2.*cos(t3).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t2).*sin(t4).*sin(t5).*1.16e-4+td1.*td3.*cos(t2).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t3).*sin(t4).*sin(t5).*1.16e-4+td1.*td3.*cos(t3).*cos(t4).*cos(t5).*cos(t6).^2.*sin(t2).*sin(t4).*sin(t5).*1.16e-4+td1.^2.*cos(t2).*cos(t3).*cos(t4).^2.*cos(t5).*cos(t6).^2.*sin(t2).*sin(t3).*sin(t5).*1.16e-4-td1.^2.*cos(t2).*cos(t3).*cos(t4).*cos(t6).*sin(t2).*sin(t3).*sin(t4).*sin(t5).*sin(t6).*1.16e-4;

end