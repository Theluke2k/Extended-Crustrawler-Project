function res = GetTau(i, t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)
    if(i==1)
        b = get_Bqdd1(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd1(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g1(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    elseif(i==2)
        b = get_Bqdd2(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd2(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g2(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    elseif(i==3)
        b = get_Bqdd3(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd3(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g3(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    elseif(i==4)
        b = get_Bqdd4(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd4(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g4(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    elseif(i==5)
        b = get_Bqdd5(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd5(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g5(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    elseif(i==6)
        b = get_Bqdd6(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
        c = get_Cqd6(t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6);
        g = get_g6(t1,t2,t3,t4,t5,t6);
        res = b + c + g;
    end
end