clear all
clc

format short
syms t1 t2 t3 t4 t5 t6 a2 a3 d4 d6


a2 = 0.222;
d4 = 0.198;
d6 = 0.24; % default 0.24

t1 = 0;
t2 = 0;
t3 = 0;
t4 = 0;
t5 = 0;
t6 = 0;

% Define transformation matrices
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

% Calculate total matrix
%T03 = T01*T12*T23;
T01
T02 = T01*T12;
T03 = T01*T12*T23;
T04 = T01*T12*T23*T34;
T05 = T01*T12*T23*T34*T45;

T36 = T34*T45*T56;
T06 = T01*T12*T23*T34*T45*T56;

% Extra information
T02 = T01*T12;
T03 = T01*T12*T23;

% Tests for dynamics
p2 = T02(1:3, 4);
R2 = T02(1:3, 1:3);

P2c2 = [-a2; 0; 0];

P0c2 = p2+R2*P2c2

% Jacobian calculation
p0 = [0 0 0]';
p1 = [0 0 0]';
p2 = [a2*cos(t1)*cos(t2) a2*sin(t1)*cos(t2) a2*sin(t2)]';
p3 = [a2*cos(t1)*cos(t2) a2*sin(t1)*cos(t2) a2*sin(t2)]';

z0 = [0 0 1]';
z1 = [sin(t1) -cos(t1) 0]';
z2 = [cos(t1)*cos(t2)*sin(t3)+cos(t1)*sin(t2)*cos(t3);
      sin(t1)*cos(t2)*sin(t3)+sin(t1)*sin(t2)*cos(t3);
      sin(t2)*sin(t3)-cos(t2)*cos(t3)];

J11 = cross(z0, p3-p0);
J12 = cross(z1, p3-p1);
J13 = cross(z2, p3-p2);

J = [J11 J12 J13;
     z0 z1 z2];
G = [0 0 1]';

J*G;


% General Jacobian calculation

% Position vectors
p0 = [0 0 0]'; % Due to alignment with base frame
p1 = T01(1:3, 4)
p2 = T02(1:3, 4)
p3 = T03(1:3, 4)
p4 = T04(1:3, 4)
p5 = T05(1:3, 4)
p6 = T06(1:3, 4)

p = [p0, p1, p2, p3, p4, p5];

% z axes
z0 = [0 0 1]'; % Due to alignment with base frame
z1 = T01(1:3, 3)
z2 = T02(1:3, 3)
z3 = T03(1:3, 3)
z4 = T04(1:3, 3)
z5 = T05(1:3, 3)
%z6 = T06(1:3, 3);

z = [z0 z1 z2 z3 z4 z5];

% Calculate jacobian using the values
for i=1:6
    J(1:3,i) = cross(z(1:3,i), p6-p(1:3,i));
    J(4:6,i) = z(1:3,i);
end
J
% Check Jacobian
G = [1 0 0 0 0 0]';

% Velocity of EE represented in base frame (frame 0)
J*G

% Velocity of EE reprented in frame 1
% JacobianR = zeros([6 6]);
% JacobianR(1:3,1:3) = T01(1:3,1:3)';
% JacobianR(4:6,4:6) = T01(1:3,1:3)';
% JacobianR*J*G
