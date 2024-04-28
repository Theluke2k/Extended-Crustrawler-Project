clear all
clc

p = pi;

% Joint positions
t1 = p;
t2 = p;
t3 = p;
t4 = p;
t5 = p;
t6 = p;

q = [t1; t2; t3; t4; t5; t6];

% % Joint velocities
td1 = p;
td2 = p;
td3 = p;
td4 = p;
td5 = p;
td6 = p;

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