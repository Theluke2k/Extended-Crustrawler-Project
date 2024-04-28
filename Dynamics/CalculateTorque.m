clear all
clc

t = pi;

% Joint positions
t1 = t;
t2 = t;
t3 = t;
t4 = t;
t5 = t;
t6 = t;

q = [t1; t2; t3; t4; t5; t6];

% % Joint velocities
td1 = t;
td2 = t;
td3 = t;
td4 = t;
td5 = t;
td6 = t;

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