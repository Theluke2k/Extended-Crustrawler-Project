function res = get_Cqd(pos, acc)
    res = zeros([6 1]);
    res(1,1) = get_Cqd1(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
    res(2,1) = get_Cqd2(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
    res(3,1) = get_Cqd3(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
    res(4,1) = get_Cqd4(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
    res(5,1) = get_Cqd5(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
    res(6,1) = get_Cqd6(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6),acc(1),acc(2),acc(3),acc(4),acc(5),acc(6));
end