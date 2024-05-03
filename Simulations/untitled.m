clear all
clc

format long

Kp = [om*om 0 0 0 0 0;
    0 om*om 0 0 0 0;
    0 0 om*om 0 0 0;
    0 0 0 om*om 0 0;
    0 0 0 0 om*om 0;
    0 0 0 0 0 om*om];
Kd = [2*zeta*om 0 0 0 0 0;
    0 2*zeta*om 0 0 0 0;
    0 0 2*zeta*om 0 0 0;
    0 0 0 2*zeta*om 0 0;
    0 0 0 0 2*zeta*om 0;
    0 0 0 0 0 2*zeta*om];

p = 0;

% Joint positions
t1 = -4.667903;
t2 = -1.578466;
t3 = -1.44501;
t4 = -1.5;
t5 = -3.098641;
t6 = -5.304505;

q = [t1; t2; t3; t4; t5; t6];

% % Joint velocities
td1 = 0;
td2 = 0;
td3 = 0;
td4 = 0;
td5 = 0;
td6 = 0;

qd = [td1; td2; td3; td4; td5; td6];

% Joint accelerations
tdd1 = 0;
tdd2 = 0;
tdd3 = 0;
tdd4 = 0;
tdd5 = 0;
tdd6 = 0;

qdd = [tdd1; tdd2; tdd3; tdd4; tdd5; tdd6];

for i=1:6
    Bqdd(1) = get_Bqdd1(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
    Bqdd(2) = get_Bqdd2(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
    Bqdd(3) = get_Bqdd3(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
    Bqdd(4) = get_Bqdd4(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
    Bqdd(5) = get_Bqdd5(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
    Bqdd(6) = get_Bqdd6(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);

    
end
t

om = 1;
zeta = 1;








get_Bqdd1(t1,t2,t3,t4,t5,t6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6)