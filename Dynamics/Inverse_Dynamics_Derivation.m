clear all
close all
clc

% Define format
format short

% Define utilized symbols as real to simplify equations
syms t1 t2 t3 t4 t5 t6 td1 td2 td3 td4 td5 td6 tdd1 tdd2 tdd3 tdd4 tdd5 tdd6 real

% Define vectors for joint position, velocity and acceleration
q = [t1; t2; t3; t4; t5; t6]; % Position
qd = [td1; td2; td3; td4; td5; td6]; % Velocity
qdd = [tdd1; tdd2; tdd3; tdd4; tdd5; tdd6]; % Acceleration

% Define manipulator lengths
a2 = 0.222;
d4 = 0.198;
d6 = 0.24;

% Local CoM vectors [m]
pc1 = [0; -21.52e-3; 0];                % Real: [0; -21.52e-3; 0.39e-3];
pc2 = [-47.45e-3; 0; 0];                % Real: [-47.45e-3; 0.53e-3; 3.5e-3]; 
pc3 = [0; 0; 102.47e-3];                % Real: [8.25e-3; 0; 102.47e-3]; 
pc4 = [0; 16.66e-3; 0];                 % Real: [0; 16.66e-3; -0.43e-3];
pc5 = [0; 0; 51.34e-3];                 % Real: [-0.87e-3; 12.26e-3; 51.34e-3];
pc6 = [0; 0; -134.7e-3];                % Real: [-1.56e-3; -0.36e-3; -134.7e-3];

% Local inertia tensors [g*m^2]
Ic1 = [0.13 0 0;
      0 0.082 0;
      0 0 0.11];
Ic2 = [0.063 0 0;
      0 0.94 0;
      0 0 0.91];
Ic3 = [0.21 0 0;
      0 0.21 0;
      0 0 0.038];
Ic4 = [0.065 0 0;
       0 0.034 0;
       0 0 0.056];
Ic5 = [0.051 0 0;
       0 0.037 0;
       0 0 0.28];
Ic6 = [0.11 0 0;
       0 0.052 0;
       0 0 0.09];

Icn = [Ic1 Ic2 Ic3 Ic4 Ic5 Ic6];

% Mass of links
m1 = 189.4e-3;
m2 = 209.66e-3;
m3 = 118.18e-3;
m4 = 146.18e-3;
m5 = 95.7e-3;
m6 = 168.06e-3;

m = [m1; m2; m3; m4; m5; m6];

%% Computation of Homogeneous Transformations
% Define homogeneous transformations between each link
T01 = [cos(t1) 0 sin(t1) 0;
       sin(t1) 0 -cos(t1) 0;
       0 1 0 0;
       0 0 0 1];
T12 = [cos(t2) -sin(t2) 0 a2*cos(t2);
       sin(t2) cos(t2) 0 a2*sin(t2);
       0 0 1 0;
       0 0 0 1];
T23 = [cos(t3) 0 sin(t3) 0;
       sin(t3) 0 -cos(t3) 0;
       0 1 0 0;
       0 0 0 1];
T34 = [cos(t4) 0 -sin(t4) 0;
       sin(t4) 0 cos(t4) 0;
       0 -1 0 d4;
        0 0 0 1];
T45 = [cos(t5) 0 sin(t5) 0;
       sin(t5) 0 -cos(t5) 0;
       0 1 0 0;
       0 0 0 1];
T56 = [cos(t6) -sin(t6) 0 0;
       sin(t6) cos(t6) 0 0;
       0 0 1 d6;
       0 0 0 1];

% Define transformation from base frame to each link
T02 = T01*T12;
T03 = T01*T12*T23;
T04 = T01*T12*T23*T34;
T05 = T01*T12*T23*T34*T45;
T06 = T01*T12*T23*T34*T45*T56;

T0n = [T01 T02 T03 T04 T05 T06];

%% Jacobian Computation
% Define position vectors from base to all link frames
p0 = [0 0 0]'; % Due to alignment with base frame
p1 = T01(1:3, 4);
p2 = T02(1:3, 4);
p3 = T03(1:3, 4);
p4 = T04(1:3, 4);
p5 = T05(1:3, 4);
p6 = T06(1:3, 4);

% Stack position vectors of frame origins in array
p = [p0, p1, p2, p3, p4, p5, p6];

% Compute position vectors from base to all link CoM's
pl1 = T01(1:3, 4) + T01(1:3,1:3)*pc1;
pl2 = T02(1:3, 4) + T02(1:3,1:3)*pc2;
pl3 = T03(1:3, 4) + T03(1:3,1:3)*pc3;
pl4 = T04(1:3, 4) + T04(1:3,1:3)*pc4;
pl5 = T05(1:3, 4) + T05(1:3,1:3)*pc5;
pl6 = T06(1:3, 4) + T06(1:3,1:3)*pc6;

% Stack position vectors of CoM in array
pl = [pl1, pl2, pl3, pl4, pl5, pl6];

% Define z-axes for each joint
z0 = [0 0 1]'; % Due to alignment with base frame
z1 = T01(1:3, 3);
z2 = T02(1:3, 3);
z3 = T03(1:3, 3);
z4 = T04(1:3, 3);
z5 = T05(1:3, 3);
z6 = T06(1:3, 3);

% Stack unit z-axes vectors in array except z6
z = [z0, z1, z2, z3, z4, z5];

% Compute all Jacobians and insert in one big matrix
for j=1:6
    for i=1:6
        if(i>j)
            J(1:3,i+(6*(j-1))) = 0;
            J(4:6,i+(6*(j-1))) = 0;
        else
            J(1:3,i+(6*(j-1))) = simplify(cross(z(1:3,i), pl(1:3,j)-p(1:3,i)));
            J(4:6,i+(6*(j-1))) = simplify(z(1:3,i));
        end
    end
end

%% Compute Kinetic Energy of Manipulator
% Compute inertia matrix, B
B = 0;
for i=1:6
    B = B + simplify(m(i)*J(1:3,(6*(i-1)+1):(6*i))'*J(1:3,(6*(i-1)+1):(6*i)) + J(4:6,(6*(i-1)+1):(6*i))'*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))*(10^(-3)*Icn(1:3,(3*(i-1)+1):(3*i))*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))')*J(4:6,(6*(i-1)+1):(6*i)));
end

% Calculate total kinetic energy of manipulator using inertia matrix
T = 0.5*qd'*B*qd;

%% Computation of Potential Energy of Manipulator
% Define gravitational acceleration in base frame
g0 = [0; 0; -9.807];

% Compute total potential energy
U = 0;
for i=1:6
    U = U - m(i)*g0'*pl(1:3,i);
end
%% Computation of Torque Using Langrangian Formulation
% Compute gravitational terms
for i=1:6
    gi = 0;
    for j=1:6   
        gi = gi - m(j)*g0'*J(1:3, (6*(j-1)+i));
    end
    g(i) = simplify(gi);
end

% Create Matlab functions for each element in the vector
g1 = matlabFunction(g(1));
g2 = matlabFunction(g(2));
g3 = matlabFunction(g(3));
g4 = matlabFunction(g(4));
g5 = matlabFunction(g(5));
g6 = matlabFunction(g(6));

% Compute the acceleration/inertia terms
for i=1:6
    sum = 0;
    for j=1:6
        sum = sum + B(i,j)*qdd(j);
    end
    Bt(i) = simplify(sum);
end

% Create Matlab functions for each element in the vector
Bqdd1 = matlabFunction(Bt(1));
Bqdd2 = matlabFunction(Bt(2));
Bqdd3 = matlabFunction(Bt(3));
Bqdd4 = matlabFunction(Bt(4));
Bqdd5 = matlabFunction(Bt(5));
Bqdd6 = matlabFunction(Bt(6));

% Compute Coriolis and centrifugal terms
for i=1:6
    sum = 0;
    for j=1:6
        for k=1:6
            sum = sum + (diff(B(i,j), q(k)) - 0.5*diff(B(j,k), q(i)))*qd(k)*qd(j);
        end
    end
    Ct(i) = simplify(sum);
end

% Create Matlab functions for each element in the vector
Cqd1 = matlabFunction(Ct(1));
Cqd2 = matlabFunction(Ct(2));
Cqd3 = matlabFunction(Ct(3));
Cqd4 = matlabFunction(Ct(4));
Cqd5 = matlabFunction(Ct(5));
Cqd6 = matlabFunction(Ct(6));
