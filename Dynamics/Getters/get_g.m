function res = get_g(pos)
    res = zeros([6 1]);
    res(1,1) = get_g1(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
    res(2,1) = get_g2(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
    res(3,1) = get_g3(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
    res(4,1) = get_g4(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
    res(5,1) = get_g5(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
    res(6,1) = get_g6(pos(1),pos(2),pos(3),pos(4),pos(5),pos(6));
end