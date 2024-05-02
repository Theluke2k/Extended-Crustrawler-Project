function res = GetTau(i, t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
    if(i==1)
        b = get_Bqdd1(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s1 = get_B11(t1,t2,t3,t4,t5,t6)*tdd1 + get_B12(t1,t2,t3,t4,t5,t6)*tdd2 + get_B13(t1,t2,t3,t4,t5,t6)*tdd3 + get_B14(t1,t2,t3,t4,t5,t6)*tdd4 + get_B15(t1,t2,t3,t4,t5,t6)*tdd5 + get_B16(t1,t2,t3,t4,t5,t6)*tdd6

        c = get_Cqd1(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g1(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    elseif(i==2)
        b = get_Bqdd2(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s2 = get_B21(t1,t2,t3,t4,t5,t6)*tdd1 + get_B22(t1,t2,t3,t4,t5,t6)*tdd2 + get_B23(t1,t2,t3,t4,t5,t6)*tdd3 + get_B24(t1,t2,t3,t4,t5,t6)*tdd4 + get_B25(t1,t2,t3,t4,t5,t6)*tdd5 + get_B26(t1,t2,t3,t4,t5,t6)*tdd6

        c = get_Cqd2(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g2(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    elseif(i==3)
        b = get_Bqdd3(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s3 = get_B31(t1,t2,t3,t4,t5,t6)*tdd1 + get_B32(t1,t2,t3,t4,t5,t6)*tdd2 + get_B33(t1,t2,t3,t4,t5,t6)*tdd3 + get_B34(t1,t2,t3,t4,t5,t6)*tdd4 + get_B35(t1,t2,t3,t4,t5,t6)*tdd5 + get_B36(t1,t2,t3,t4,t5,t6)*tdd6
        
        c = get_Cqd3(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g3(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    elseif(i==4)
        b = get_Bqdd4(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s4 = get_B41(t1,t2,t3,t4,t5,t6)*tdd1 + get_B42(t1,t2,t3,t4,t5,t6)*tdd2 + get_B43(t1,t2,t3,t4,t5,t6)*tdd3 + get_B44(t1,t2,t3,t4,t5,t6)*tdd4 + get_B45(t1,t2,t3,t4,t5,t6)*tdd5 + get_B46(t1,t2,t3,t4,t5,t6)*tdd6

        c = get_Cqd4(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g4(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    elseif(i==5)
        b = get_Bqdd5(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s5 = get_B51(t1,t2,t3,t4,t5,t6)*tdd1 + get_B52(t1,t2,t3,t4,t5,t6)*tdd2 + get_B53(t1,t2,t3,t4,t5,t6)*tdd3 + get_B54(t1,t2,t3,t4,t5,t6)*tdd4 + get_B55(t1,t2,t3,t4,t5,t6)*tdd5 + get_B56(t1,t2,t3,t4,t5,t6)*tdd6

        c = get_Cqd5(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g5(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    elseif(i==6)
        b = get_Bqdd6(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
        %s6 = get_B61(t1,t2,t3,t4,t5,t6)*tdd1 + get_B62(t1,t2,t3,t4,t5,t6)*tdd2 + get_B63(t1,t2,t3,t4,t5,t6)*tdd3 + get_B64(t1,t2,t3,t4,t5,t6)*tdd4 + get_B65(t1,t2,t3,t4,t5,t6)*tdd5 + get_B66(t1,t2,t3,t4,t5,t6)*tdd6

        c = get_Cqd6(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6)
        g = get_g6(t1,t2,t3,t4,t5,t6)
        res = b + c + g;
    end
end