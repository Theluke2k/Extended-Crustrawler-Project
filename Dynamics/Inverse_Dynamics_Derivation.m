clear all
close all
clc

% Define format
format short

% Define mass properties
% Local CoM's [m]
pc1 = [0; -21.52e-3; 0];                % Real: [0; -21.52e-3; 0.39e-3];
pc2 = [-47.45e-3; 0; 0];                % Real: [-47.45e-3; 0.53e-3; 3.5e-3]; 
pc3 = [0; 0; 102.47e-3];               % Real: [8.25e-3; 0; 102.47e-3]; 
pc4 = [0; 16.66e-3; 0];                 % Real: [0; 16.66e-3; -0.43e-3];
pc5 = [0; 0; 51.34e-3];                 % Real: [-0.87e-3; 12.26e-3; 51.34e-3];
pc6 = [0; 0; -134.7e-3];                % Real: [-1.56e-3; -0.36e-3; -134.7e-3];

% Local inertia tensors [g*m^2]
Ic1 = [0.13 0 0;
      0 0.082 0;
      0 0 0.11];      %Måske bedre at runde den her op til 0.13?
Ic2 = [0.063 0 0;
      0 0.94 0;
      0 0 0.91];
Ic3 = [0.21 0 0                     ;          % Real: [0.21 0 0.021;0 0.21 0;0.18 0 0.038]
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
%% Forward Kinematics
% Define utilized symbols
syms a2 a3 d4 d6 t1 t2 t3 t4 t5 t6 td1 td2 td3 td4 td5 td6 tdd1 tdd2 tdd3 tdd4 tdd5 tdd6 real

% Assign values to symbols if desired
a2 = 0.222;
d4 = 0.198;
d6 = 0.24;

% % Joint positions
% t1 = 0;
% t2 = 0;
% t3 = pi/2;
% t4 = pi/2;
% t5 = 0;
% t6 = 0;

q = [t1; t2; t3; t4; t5; t6];

% % Joint velocities
% td1 = 0;
% td2 = 0;
% td3 = pi/2;
% td4 = 0;
% td5 = 0;
% td6 = 0;

qd = [td1; td2; td3; td4; td5; td6];

% Joint accelerations
% tdd1 = 0;
% tdd2 = 0;
% tdd3 = pi;
% tdd4 = 0;
% tdd5 = 0;
% tdd6 = 0;

qdd = [tdd1; tdd2; tdd3; tdd4; tdd5; tdd6];

% Homogeneous transforms
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

%% Compute Jacobians in Center of masses
% Define position vectors from base to rest of frames
p0 = [0 0 0]'; % Due to alignment with base frame
p1 = T01(1:3, 4);
p2 = T02(1:3, 4);
p3 = T03(1:3, 4);
p4 = T04(1:3, 4);
p5 = T05(1:3, 4);
p6 = T06(1:3, 4);

% Stack position vectors of frame origins in array except p6
p = [p0, p1, p2, p3, p4, p5, p6];

% Define position vectors from base to link CoM
pl1 = T01(1:3, 4) + T01(1:3,1:3)*pc1;
pl2 = T02(1:3, 4) + T02(1:3,1:3)*pc2;
pl3 = T03(1:3, 4) + T03(1:3,1:3)*pc3;
pl4 = T04(1:3, 4) + T04(1:3,1:3)*pc4;
pl5 = T05(1:3, 4) + T05(1:3,1:3)*pc5;
pl6 = T06(1:3, 4) + T06(1:3,1:3)*pc6;

% Stack position vectors of CoM in array
pl = [pl1, pl2, pl3, pl4, pl5, pl6];

% z axes
z0 = [0 0 1]'; % Due to alignment with base frame
z1 = T01(1:3, 3);
z2 = T02(1:3, 3);
z3 = T03(1:3, 3);
z4 = T04(1:3, 3);
z5 = T05(1:3, 3);
%z6 = T06(1:3, 3);

% Stack unit z-axes vectors in array except z6
z = [z0, z1, z2, z3, z4, z5];

% Compute all Jacobians
for j=1:6
    for i=1:6
        if(i>j)
            J(1:3,i+(6*(j-1))) = 0;
            J(4:6,i+(6*(j-1))) = 0;
        else
            J(1:3,i+(6*(j-1))) = simplify(cross(z(1:3,i), pl(1:3,j)-p(1:3,i)));
            J(4:6,i+(6*(j-1))) = simplify(z(1:3,i));
            % J(1:3,i+(6*(j-1))) = cross(z(1:3,i), pl(1:3,j)-p(1:3,i));
            % J(4:6,i+(6*(j-1))) = z(1:3,i);
        end
    end
end

% Manual Computation of Jacbians
% for i=1:6
%     if(i>1)
%         J1(1:3,i) = 0;
%         J1(4:6,i) = 0;
%     else
%         J1(1:3,i) = cross(z(1:3,i), pl1-p(1:3,i));
%         J1(4:6,i) = z(1:3,i);
%     end
% end
% for i=1:6
%     if(i>2)
%         J2(1:3,i) = 0;
%         J2(4:6,i) = 0;
%     else
%         J2(1:3,i) = cross(z(1:3,i), pl2-p(1:3,i));
%         J2(4:6,i) = z(1:3,i);
%     end
% end
% for i=1:6
%     if(i>3)
%         J3(1:3,i) = 0;
%         J3(4:6,i) = 0;
%     else
%         J3(1:3,i) = cross(z(1:3,i), pl3-p(1:3,i));
%         J3(4:6,i) = z(1:3,i);
%     end
% end
% for i=1:6
%     if(i>4)
%         J4(1:3,i) = 0;
%         J4(4:6,i) = 0;
%     else
%         J4(1:3,i) = cross(z(1:3,i), pl4-p(1:3,i));
%         J4(4:6,i) = z(1:3,i);
%     end
% end
% for i=1:6
%     if(i>5)
%         J5(1:3,i) = 0;
%         J5(4:6,i) = 0;
%     else
%         J5(1:3,i) = cross(z(1:3,i), pl5-p(1:3,i));
%         J5(4:6,i) = z(1:3,i);
%     end
% end
% for i=1:6
%     if(i>6)
%         J6(1:3,i) = 0;
%         J6(4:6,i) = 0;
%     else
%         J6(1:3,i) = cross(z(1:3,i), pl6-p(1:3,i));
%         J6(4:6,i) = z(1:3,i);
%     end
% end
% % Test Jacobian
% G = [pi; 0; 0; 0; 0; 0];
% 
% J6*G;

%% Compute Kinetic Energy of Links
% Manual computation of kinetic energies
% K1 = 0.5*m1*qd'*J1(1:3,1:6)'*J1(1:3,1:6)*qd + 0.5*qd'*J1(4:6,1:6)'*T01(1:3,1:3)*(Ic1*10^-3)*T01(1:3,1:3)'*J1(4:6,1:6)*qd
% K2 = 0.5*m2*qd'*J2(1:3,1:6)'*J2(1:3,1:6)*qd+0.5*qd'*J2(4:6,1:6)'*T02(1:3,1:3)*(Ic2*10^-3)*T02(1:3,1:3)'*J2(4:6,1:6)*qd
% K3 = 0.5*m3*qd'*J3(1:3,1:6)'*J3(1:3,1:6)*qd+0.5*qd'*J3(4:6,1:6)'*T03(1:3,1:3)*(Ic3*10^-3)*T03(1:3,1:3)'*J3(4:6,1:6)*qd
% K4 = 0.5*m4*qd'*J4(1:3,1:6)'*J4(1:3,1:6)*qd+0.5*qd'*J4(4:6,1:6)'*T04(1:3,1:3)*(Ic4*10^-3)*T04(1:3,1:3)'*J4(4:6,1:6)*qd
% K5 = 0.5*m5*qd'*J5(1:3,1:6)'*J5(1:3,1:6)*qd+0.5*qd'*J5(4:6,1:6)'*T05(1:3,1:3)*(Ic5*10^-3)*T05(1:3,1:3)'*J5(4:6,1:6)*qd
% K6 = 0.5*m6*qd'*J6(1:3,1:6)'*J6(1:3,1:6)*qd+0.5*qd'*J6(4:6,1:6)'*T06(1:3,1:3)*(Ic6*10^-3)*T06(1:3,1:3)'*J6(4:6,1:6)*qd

% For loop computes kinetic energy for all links. Result in vector. (unused)
for i=1:6
    %K(i) = 0.5*m(i)*qd'*J(1:3,(6*(i-1)+1):(6*i))'*J(1:3,(6*(i-1)+1):(6*i))*qd + 0.5*qd'*J(4:6,(6*(i-1)+1):(6*i))'*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))*(10^(-3)*Icn(1:3,(3*(i-1)+1):(3*i))*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))')*J(4:6,(6*(i-1)+1):(6*i))*qd;
end

% If calculating symbolically, define manipulator variables here
% ...

% Substitute the values in the symbolic expression with values and convert
% to double.
% K_val = subs(K, [a2, d4, d6, t1, t2, t3, t4, t5, t6, td1, td2, td3, td4, td5, td6], [ga2, gd4, gd6, gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6])
% K_num = double(K_val)

B = 0;
% Compute inertia matrix, B (7.32)
for i=1:6
    B = B + simplify(m(i)*J(1:3,(6*(i-1)+1):(6*i))'*J(1:3,(6*(i-1)+1):(6*i)) + J(4:6,(6*(i-1)+1):(6*i))'*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))*(10^(-3)*Icn(1:3,(3*(i-1)+1):(3*i))*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))')*J(4:6,(6*(i-1)+1):(6*i)));
    % B = B + m(i)*J(1:3,(6*(i-1)+1):(6*i))'*J(1:3,(6*(i-1)+1):(6*i)) + J(4:6,(6*(i-1)+1):(6*i))'*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))*(10^(-3)*Icn(1:3,(3*(i-1)+1):(3*i))*T0n(1:3,(4*(i-1)+1):(4*(i-1)+3))')*J(4:6,(6*(i-1)+1):(6*i));
end

% Calculate total kinetic energy of manipulator using inertia matrix (7.31)
T = 0.5*qd'*B*qd;

%% Computation of Potential Energy of Links
% Define gravitational acceleration in base frame ()
g0 = [0; 0; -9.807];

% Compute total potential energy (7.36)
U = 0;
for i=1:6
    U = U - m(i)*g0'*pl(1:3,i);
end
%% Computation of Torque Using Langrangian
% Compute required torque to each motor for robot to be in static position
% (7.39). These are the gravitational terms in the EoM.
for i=1:6
    gi = 0;
    for j=1:6   
        gi = gi - m(j)*g0'*J(1:3, (6*(j-1)+i));
    end
    g(i) = simplify(gi);
end

f1 = matlabFunction(g(1));
f2 = matlabFunction(g(2));
f3 = matlabFunction(g(3));
f4 = matlabFunction(g(4));
f5 = matlabFunction(g(5));
f6 = matlabFunction(g(6));

% Compute the acceleration/inertia terms (7.40)
% for i=1:6
%     sum = 0;
%     for j=1:6
%         sum = sum + B(i,j)*qdd(j);
%     end
%     Bt(i) = simplify(sum);
% end


% % Compute Coriolis and centrifugal terms
% for i=1:6
%     sum = 0;
%     for j=1:6
%         for k=1:6
%             sum = sum + (diff(B(i,j), q(k)) - 0.5*diff(B(j,k), q(i)))*qd(k)*qd(j);
%         end
%     end
%     Ct(i) = simplify(sum);
%     % Ct(i) = sum;
% end



%% Tests

% Test code ---
% 
% Lengths
ga2 = 0.222;
gd4 = 0.198;
gd6 = 0.24;

% % Joint positions
gt1 = 0;
gt2 = 0;
gt3 = pi;
gt4 = 0;
gt5 = 0;
gt6 = 0;

% % Joint velocities
gtd1 = pi;
gtd2 = pi;
gtd3 = pi;
gtd4 = pi;
gtd5 = pi;
gtd6 = pi;

% t(1, 1) = tau1(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t(2, 1) = tau2(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t(3, 1) = tau3(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t(4, 1) = tau4(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t(5, 1) = tau5(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t(6, 1) = tau6(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6);
% t

% for i=1:1000
%     t(1, i) = tau1(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
%     t(2, i) = tau2(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
%     t(3, i) = tau3(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
%     t(4, i) = tau4(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
%     t(5, i) = tau5(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
%     t(6, i) = tau6(gt1, gt2, gt3, gt4, gt5, gt6, (2*pi)/1000, gtd2, gtd3, gtd4, gtd5, gtd6);
% end
% t

% f1(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)
% f2(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)
% f3(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)
% f4(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)
% f5(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)
% f6(gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6)

% for i=1:6
%     Ct_val(i) = double(subs(Ct(i), [t1, t2, t3, t4, t5, t6, td1, td2, td3, td4, td5, td6], [gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6]));
% end
% Ct_val

%C_val = double(subs(Ct(2), [t1, t2, t3, t4, t5, t6, td1, td2, td3, td4, td5, td6], [gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6]))


% F = diff(B(2,2), t2);
%double(subs(g(6), [a2, d4, d6, t1, t2, t3, t4, t5, t6, td1, td2, td3, td4, td5, td6], [ga2, gd4, gd6, gt1, gt2, gt3, gt4, gt5, gt6, gtd1, gtd2, gtd3, gtd4, gtd5, gtd6]))
