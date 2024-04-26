clear all
clc

% Joint positions
t1 = 0;
t2 = 0;
t3 = pi/2;
t4 = 0;
t5 = 0;
t6 = 0;

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
    t(i) = GetTau(i,t1,t2,t3,t4,t5,t6,td1,td2,td3,td4,td5,td6,tdd1,tdd2,tdd3,tdd4,tdd5,tdd6);
end
t