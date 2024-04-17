% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(92).translation = [0.0 0.0 0.0];
smiData.RigidTransform(92).angle = 0.0;
smiData.RigidTransform(92).axis = [0.0 0.0 0.0];
smiData.RigidTransform(92).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [17.000000000000028 19.999999999999989 64.999999999999972];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = "B[Link-1-1:-:Link-plate-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [16.999999999993719 7.499999999996704 -6.0396132539608516e-14];  % mm
smiData.RigidTransform(2).angle = 3.0984193320667547e-14;  % rad
smiData.RigidTransform(2).axis = [0.00059486579952233764 -0.01203345031789029 0.99992741847002453];
smiData.RigidTransform(2).ID = "F[Link-1-1:-:Link-plate-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-10.849999999999943 4.9999999999999769 0.50000000000000044];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "B[Servo-disc-link_MX-106T-2:-:Link-1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [17.000000000000028 19.999999999999996 -64.999999999999986];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897927;  % rad
smiData.RigidTransform(4).axis = [9.833936050592177e-17 9.1181402706030898e-17 1];
smiData.RigidTransform(4).ID = "F[Servo-disc-link_MX-106T-2:-:Link-1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-12.500000000000011 1.0000000000000564 33.499999999999986];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = "B[Link-2-1:-:Link-plate-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-12.500000000015881 -11.500000000000703 -2.8421709430404007e-14];  % mm
smiData.RigidTransform(6).angle = 2.2887833992611182e-16;  % rad
smiData.RigidTransform(6).axis = [-0.48507125007266594 -0.48507125007266594 -0.72760687510899891];
smiData.RigidTransform(6).ID = "F[Link-2-1:-:Link-plate-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [-17.000000000000014 20.000000000000018 -33.500050000000016];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "B[Link-2-1:-:servo-disc-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [-10.849999999989588 20.000000000005251 0.49994999999985801];  % mm
smiData.RigidTransform(8).angle = 1.9991722838696003e-15;  % rad
smiData.RigidTransform(8).axis = [0.9996144206527191 0.027767067240325211 2.7744873638871586e-17];
smiData.RigidTransform(8).ID = "F[Link-2-1:-:servo-disc-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [-10.000000000000009 -7.4999999999999787 0.99999999999994538];  % mm
smiData.RigidTransform(9).angle = 0;  % rad
smiData.RigidTransform(9).axis = [0 0 0];
smiData.RigidTransform(9).ID = "B[Link-plate-1:-:servo-link-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [-14.500000000000172 22.499999999999723 0.50000000000038192];  % mm
smiData.RigidTransform(10).angle = 3.1415926535897913;  % rad
smiData.RigidTransform(10).axis = [1 -5.012266643400487e-16 -1.291725244562808e-16];
smiData.RigidTransform(10).ID = "F[Link-plate-1:-:servo-link-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [10.999999999999982 -47.800000000000011 -14.499999999996502];  % mm
smiData.RigidTransform(11).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(11).axis = [1 0 0];
smiData.RigidTransform(11).ID = "B[mx-106t_default_sldprt.step-1:-:servo-link-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [-18.999999999996479 3.9999999998971063 -4.4999999999125784];  % mm
smiData.RigidTransform(12).angle = 2.0943951023923657;  % rad
smiData.RigidTransform(12).axis = [0.57735026918934917 -0.57735026919017651 -0.57735026918935173];
smiData.RigidTransform(12).ID = "F[mx-106t_default_sldprt.step-1:-:servo-link-link_mx-106t_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(13).translation = [0 0 0];  % mm
smiData.RigidTransform(13).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(13).axis = [1 0 0];
smiData.RigidTransform(13).ID = "B[Link-plate-2:-:Servo-Disc-14]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(14).translation = [2.9999999999997122 1.4592771435673058e-10 -1.3636913820391783e-10];  % mm
smiData.RigidTransform(14).angle = 2.3116612884304839;  % rad
smiData.RigidTransform(14).axis = [-0.6347903927281715 0.44054774383717832 -0.63479039272817117];
smiData.RigidTransform(14).ID = "F[Link-plate-2:-:Servo-Disc-14]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(15).translation = [22.500000000000036 -11.499999999999954 1.0000000000000009];  % mm
smiData.RigidTransform(15).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(15).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(15).ID = "B[Link-plate-2:-:MX-28T-4]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(16).translation = [-22.500000000009319 -11.499999999997147 19.750000000000597];  % mm
smiData.RigidTransform(16).angle = 2.0943951023932286;  % rad
smiData.RigidTransform(16).axis = [-0.57735026918963683 0.57735026918960486 0.5773502691896355];
smiData.RigidTransform(16).ID = "F[Link-plate-2:-:MX-28T-4]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(17).translation = [-13.499999999999957 19.999999999999961 0.50000000000000044];  % mm
smiData.RigidTransform(17).angle = 0;  % rad
smiData.RigidTransform(17).axis = [0 0 0];
smiData.RigidTransform(17).ID = "B[Servo-disc-link_MX-64T-2:-:Link-plate-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(18).translation = [17.000000000000039 7.4999999999999361 0.99999999999997158];  % mm
smiData.RigidTransform(18).angle = 3.1415926535897922;  % rad
smiData.RigidTransform(18).axis = [3.8857805861880479e-16 -1 -5.5511151231257827e-17];
smiData.RigidTransform(18).ID = "F[Servo-disc-link_MX-64T-2:-:Link-plate-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(19).translation = [-11.127999999999972 -32.269999999999996 -17.750000000000004];  % mm
smiData.RigidTransform(19).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(19).axis = [1 0 0];
smiData.RigidTransform(19).ID = "B[MX-28T-5:-:Link-plate-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(20).translation = [16.169999999999959 16.427999999999926 -2.4868995751603507e-14];  % mm
smiData.RigidTransform(20).angle = 1.5707963267948966;  % rad
smiData.RigidTransform(20).axis = [-3.5817734213723617e-16 4.869739891386396e-16 -1];
smiData.RigidTransform(20).ID = "F[MX-28T-5:-:Link-plate-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(21).translation = [0 9.9999999999999947 0];  % mm
smiData.RigidTransform(21).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(21).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(21).ID = "B[Base-1:-:MX-106T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(22).translation = [-0.9000000000000129 -0.75000000000000355 17];  % mm
smiData.RigidTransform(22).angle = 1.5707963267948966;  % rad
smiData.RigidTransform(22).axis = [7.8504622934188746e-17 7.8504622934188758e-17 -1];
smiData.RigidTransform(22).ID = "F[Base-1:-:MX-106T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(23).translation = [0 1.0000000000000009 0];  % mm
smiData.RigidTransform(23).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(23).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(23).ID = "B[Base-disc-1:-:Servo-link-link_MX-106T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(24).translation = [-4.4999999999998508 15.000000000000233 0.50000000000005507];  % mm
smiData.RigidTransform(24).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(24).axis = [-0.70710678118654791 -0.70710678118654724 1.1102230246251563e-16];
smiData.RigidTransform(24).ID = "F[Base-disc-1:-:Servo-link-link_MX-106T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(25).translation = [0 0 30.800000000003493];  % mm
smiData.RigidTransform(25).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(25).axis = [1 0 0];
smiData.RigidTransform(25).ID = "B[MX-106T-1:-:Base-disc-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(26).translation = [3.8862679021260581e-11 1.0000000000034959 8.487354804720626e-11];  % mm
smiData.RigidTransform(26).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(26).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(26).ID = "F[MX-106T-1:-:Base-disc-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(27).translation = [8.9250000000000167 20.585000000000019 0.50000000000000044];  % mm
smiData.RigidTransform(27).angle = 0;  % rad
smiData.RigidTransform(27).axis = [0 0 0];
smiData.RigidTransform(27).ID = "B[Servo-disc-link_MX-28T-1:-:Finger-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(28).translation = [-9.0000000000000959 21.999999999999925 -1.0000000000000018];  % mm
smiData.RigidTransform(28).angle = 1.570796326794897;  % rad
smiData.RigidTransform(28).axis = [-1.8844176091038664e-16 -5.5290560605602457e-16 1];
smiData.RigidTransform(28).ID = "F[Servo-disc-link_MX-28T-1:-:Finger-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(29).translation = [8.9250000000000718 4.4150000000000302 0.50000000000000044];  % mm
smiData.RigidTransform(29).angle = 0;  % rad
smiData.RigidTransform(29).axis = [0 0 0];
smiData.RigidTransform(29).ID = "B[Servo-disc-link_MX-28T-2:-:Finger-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(30).translation = [-8.9999999999999787 2.9999999999999987 -1.000000000000016];  % mm
smiData.RigidTransform(30).angle = 1.5707963267948939;  % rad
smiData.RigidTransform(30).axis = [1.1791026374295161e-16 -2.3321392867754148e-16 -1];
smiData.RigidTransform(30).ID = "F[Servo-disc-link_MX-28T-2:-:Finger-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(31).translation = [2.0000000000000018 0 9.5000000000000053];  % mm
smiData.RigidTransform(31).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(31).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(31).ID = "B[Servo-Disc-16:-:Servo-disc-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(32).translation = [28.500000000000028 12.500000000000028 -28.500000000000014];  % mm
smiData.RigidTransform(32).angle = 2.0943951023931966;  % rad
smiData.RigidTransform(32).axis = [-0.57735026918962606 -0.57735026918962518 0.57735026918962606];
smiData.RigidTransform(32).ID = "F[Servo-Disc-16:-:Servo-disc-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(33).translation = [2.0000000000000018 0 9.5000000000000036];  % mm
smiData.RigidTransform(33).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(33).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(33).ID = "B[Servo-Disc-17:-:Servo-disc-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(34).translation = [-21.300000000003209 12.499999999999709 -28.500000000000121];  % mm
smiData.RigidTransform(34).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(34).axis = [0.57735026918962551 0.57735026918962606 0.57735026918962573];
smiData.RigidTransform(34).ID = "F[Servo-Disc-17:-:Servo-disc-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(35).translation = [0 0 17.750000000000014];  % mm
smiData.RigidTransform(35).angle = 0;  % rad
smiData.RigidTransform(35).axis = [0 0 0];
smiData.RigidTransform(35).ID = "B[MX-28T-4:-:Servo-Disc-14]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(36).translation = [-8.4036629610275335e-13 1.538108146695075e-10 -1.4362026391001512e-10];  % mm
smiData.RigidTransform(36).angle = 2.094395102393197;  % rad
smiData.RigidTransform(36).axis = [0.57735026918962529 0.57735026918962629 0.57735026918962573];
smiData.RigidTransform(36).ID = "F[MX-28T-4:-:Servo-Disc-14]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(37).translation = [0 0 -17.049999999995951];  % mm
smiData.RigidTransform(37).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(37).axis = [1 0 0];
smiData.RigidTransform(37).ID = "B[MX-28T-4:-:Servo-Disc-15]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(38).translation = [0.29999999999611709 1.9863033440259414e-10 -7.0412981001410913e-11];  % mm
smiData.RigidTransform(38).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(38).axis = [0.57735026918962573 0.57735026918962573 0.57735026918962562];
smiData.RigidTransform(38).ID = "F[MX-28T-4:-:Servo-Disc-15]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(39).translation = [0 0 28.000000000003354];  % mm
smiData.RigidTransform(39).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(39).axis = [1 0 3.1528599175878464e-16];
smiData.RigidTransform(39).ID = "B[MX-64T-2:-:Servo-Disc-16]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(40).translation = [2.6999999999997542 -4.1544545581473358e-13 -5.6075144527767407e-12];  % mm
smiData.RigidTransform(40).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(40).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962562];
smiData.RigidTransform(40).ID = "F[MX-64T-2:-:Servo-Disc-16]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(41).translation = [0 0 -19.799999999996707];  % mm
smiData.RigidTransform(41).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(41).axis = [1 0 0];
smiData.RigidTransform(41).ID = "B[MX-64T-2:-:Servo-Disc-17]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(42).translation = [-0.70000000000295337 -1.3011813848606835e-13 -5.500155886295488e-12];  % mm
smiData.RigidTransform(42).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(42).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962562];
smiData.RigidTransform(42).ID = "F[MX-64T-2:-:Servo-Disc-17]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(43).translation = [0 0 17.750000000000028];  % mm
smiData.RigidTransform(43).angle = 0;  % rad
smiData.RigidTransform(43).axis = [0 0 0];
smiData.RigidTransform(43).ID = "B[MX-28T-5:-:Servo-Disc-20]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(44).translation = [-2.8499999999998997 2.0294876890147862e-13 -4.1966430330830917e-14];  % mm
smiData.RigidTransform(44).angle = 2.0943951023931966;  % rad
smiData.RigidTransform(44).axis = [0.57735026918962562 0.57735026918962606 0.57735026918962562];
smiData.RigidTransform(44).ID = "F[MX-28T-5:-:Servo-Disc-20]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(45).translation = [-15.000000000000014 -29.500000000000053 15.000000000004066];  % mm
smiData.RigidTransform(45).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(45).axis = [1 0 0];
smiData.RigidTransform(45).ID = "B[MX-28T-1:-:MX-28T-Link-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(46).translation = [-4.4999999999999174 6.3948846218409017e-14 -17];  % mm
smiData.RigidTransform(46).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(46).axis = [5.5511151231257827e-17 -0.70710678118654757 0.70710678118654757];
smiData.RigidTransform(46).ID = "F[MX-28T-1:-:MX-28T-Link-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(47).translation = [14.999999999999986 -12.499999999999984 15.000000000004066];  % mm
smiData.RigidTransform(47).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(47).axis = [1 0 0];
smiData.RigidTransform(47).ID = "B[MX-28T-2:-:MX-28T-Link-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(48).translation = [4.5000000000000675 2.6867397195928788e-13 9.0594198809412774e-14];  % mm
smiData.RigidTransform(48).angle = 2.0943951023931962;  % rad
smiData.RigidTransform(48).axis = [0.57735026918962595 -0.57735026918962562 0.57735026918962562];
smiData.RigidTransform(48).ID = "F[MX-28T-2:-:MX-28T-Link-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(49).translation = [12.500000000000068 26.000000000000011 -4.5000000000000036];  % mm
smiData.RigidTransform(49).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(49).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(49).ID = "B[Servo-link-link_MX-106T-1:-:MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(50).translation = [-11.000000000000174 -47.800000000000132 17.000000000001112];  % mm
smiData.RigidTransform(50).angle = 3.1415926535897918;  % rad
smiData.RigidTransform(50).axis = [1.1102230246251565e-16 5.8422554362808938e-16 -1];
smiData.RigidTransform(50).ID = "F[Servo-link-link_MX-106T-1:-:MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(51).translation = [8.5000000000000071 4.0000000000000036 -4.5000000000000036];  % mm
smiData.RigidTransform(51).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(51).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(51).ID = "B[Servo-link-link_MX-28T-1:-:MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(52).translation = [-8.5000000000000497 -35.800000000000011 15.000000000003919];  % mm
smiData.RigidTransform(52).angle = 2.2562477913805841e-16;  % rad
smiData.RigidTransform(52).axis = [0.17743691704416314 -0.98413217632077388 -1.9699455072093383e-17];
smiData.RigidTransform(52).ID = "F[Servo-link-link_MX-28T-1:-:MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(53).translation = [8.5000000000000639 25.999999999999968 -4.5000000000000178];  % mm
smiData.RigidTransform(53).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(53).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(53).ID = "B[Servo-link-link_MX-28T-1:-:MX-28T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(54).translation = [8.5000000000000746 -35.80000000000004 15.000000000003855];  % mm
smiData.RigidTransform(54).angle = 5.5670934529896699e-16;  % rad
smiData.RigidTransform(54).axis = [0.60304933902240399 -0.79770388911214518 -1.3390385223353081e-16];
smiData.RigidTransform(54).ID = "F[Servo-link-link_MX-28T-1:-:MX-28T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(55).translation = [-22.499999999999964 30 0.50000000000000044];  % mm
smiData.RigidTransform(55).angle = 0;  % rad
smiData.RigidTransform(55).axis = [0 0 0];
smiData.RigidTransform(55).ID = "B[Servo-link-link_MX-28T-1:-:connection plate m28-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(56).translation = [-46.556217810725308 10.195983069501921 -28.570451820132391];  % mm
smiData.RigidTransform(56).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(56).axis = [-0.57735026918962573 0.57735026918962573 -0.57735026918962584];
smiData.RigidTransform(56).ID = "F[Servo-link-link_MX-28T-1:-:connection plate m28-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(57).translation = [11.000000000000011 -45.300000000000004 -17.000000000003261];  % mm
smiData.RigidTransform(57).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(57).axis = [1 0 0];
smiData.RigidTransform(57).ID = "B[MX-64T-2:-:Servo-link-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(58).translation = [-21.5 4.0000000000002345 -4.5000000000010871];  % mm
smiData.RigidTransform(58).angle = 2.0943951023931926;  % rad
smiData.RigidTransform(58).axis = [0.57735026918962495 -0.57735026918962751 -0.57735026918962484];
smiData.RigidTransform(58).ID = "F[MX-64T-2:-:Servo-link-link_MX-64T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(59).translation = [0 0 30.800000000003518];  % mm
smiData.RigidTransform(59).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(59).axis = [1 0 0];
smiData.RigidTransform(59).ID = "B[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(60).translation = [2.5000000000345501 -5.4296567242317906e-12 1.9242518689566168e-10];  % mm
smiData.RigidTransform(60).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(60).axis = [-0.57735026918962584 -0.57735026918962573 0.57735026918962573];
smiData.RigidTransform(60).ID = "F[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(61).translation = [-22.499999999999993 22.000000000000021 -38.000000000000007];  % mm
smiData.RigidTransform(61).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(61).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(61).ID = "B[servo-disc-link_mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(62).translation = [-54.300000000008765 -6.7175144212474365 -6.7175144212311935];  % mm
smiData.RigidTransform(62).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(62).axis = [0.57735026918962573 0.57735026918962584 0.57735026918962573];
smiData.RigidTransform(62).ID = "F[servo-disc-link_mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(63).translation = [0 0 -22.29999999999653];  % mm
smiData.RigidTransform(63).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(63).axis = [1 0 0];
smiData.RigidTransform(63).ID = "B[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(64).translation = [-0.70000000003455087 -1.3495181296237224e-10 -9.0548679665403142e-11];  % mm
smiData.RigidTransform(64).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(64).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(64).ID = "F[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(65).translation = [-21.499999999999993 25.000000000000021 -0.50000000000000044];  % mm
smiData.RigidTransform(65).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(65).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(65).ID = "B[servo-disc-link_mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(66).translation = [2.0000000000087113 37.499999999993605 12.499999999996126];  % mm
smiData.RigidTransform(66).angle = 1.570796326794897;  % rad
smiData.RigidTransform(66).axis = [1.2078825548606614e-14 -1 -1.2369997968434785e-14];
smiData.RigidTransform(66).ID = "F[servo-disc-link_mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(67).translation = [2.0000000000000018 9.5000000000000089 0];  % mm
smiData.RigidTransform(67).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(67).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(67).ID = "B[Servo-Disc-20:-:connection plate m28-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(68).translation = [-45.556217810725315 2.4134974907740343 -7.171946208585612];  % mm
smiData.RigidTransform(68).angle = 1.7177715174583992;  % rad
smiData.RigidTransform(68).axis = [-0.35740674433659092 -0.86285620946101826 0.35740674433659214];
smiData.RigidTransform(68).ID = "F[Servo-Disc-20:-:connection plate m28-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(69).translation = [0 0 30.800000000003504];  % mm
smiData.RigidTransform(69).angle = 0;  % rad
smiData.RigidTransform(69).axis = [0 0 0];
smiData.RigidTransform(69).ID = "B[MX-106T-2:-:Servo-Disc-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(70).translation = [2.0000000000054534 1.9644523854833729e-11 -6.7466920938841213e-11];  % mm
smiData.RigidTransform(70).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(70).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962562];
smiData.RigidTransform(70).ID = "F[MX-106T-2:-:Servo-Disc-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(71).translation = [2.0000000000000018 9.4999999999999538 0];  % mm
smiData.RigidTransform(71).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(71).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(71).ID = "B[Servo-Disc-2:-:Servo-disc-link_MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(72).translation = [-21.500000000008313 21.999999999979345 -38.000000000058073];  % mm
smiData.RigidTransform(72).angle = 2.0943951023931797;  % rad
smiData.RigidTransform(72).axis = [0.57735026918963861 0.57735026918962062 0.57735026918961807];
smiData.RigidTransform(72).ID = "F[Servo-Disc-2:-:Servo-disc-link_MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(73).translation = [0 0 -24.500000000003507];  % mm
smiData.RigidTransform(73).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(73).axis = [1 0 0];
smiData.RigidTransform(73).ID = "B[MX-106T-2:-:Servo-Disc-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(74).translation = [1.9999999999928972 -3.002516204414496e-12 4.056710523059337e-11];  % mm
smiData.RigidTransform(74).angle = 2.0943951023931797;  % rad
smiData.RigidTransform(74).axis = [0.57735026918963861 0.5773502691896204 0.57735026918961818];
smiData.RigidTransform(74).ID = "F[MX-106T-2:-:Servo-Disc-3]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(75).translation = [2.0000000000000018 9.4999999999999805 0];  % mm
smiData.RigidTransform(75).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(75).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(75).ID = "B[Servo-Disc-3:-:Servo-disc-link_MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(76).translation = [33.800000000000061 22.000000000000242 -37.999999999999197];  % mm
smiData.RigidTransform(76).angle = 2.094395102393193;  % rad
smiData.RigidTransform(76).axis = [0.57735026918962495 0.57735026918962729 0.57735026918962506];
smiData.RigidTransform(76).ID = "F[Servo-Disc-3:-:Servo-disc-link_MX-106T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(77).translation = [2.0000000000000573 0 9.5000000000000089];  % mm
smiData.RigidTransform(77).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(77).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(77).ID = "B[Servo-Disc-6:-:Servo-disc-link_MX-28T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(78).translation = [20.350000000000083 21.999999999999993 -38];  % mm
smiData.RigidTransform(78).angle = 1.5707963267948972;  % rad
smiData.RigidTransform(78).axis = [2.2232754541908913e-17 1 4.5124825252991677e-16];
smiData.RigidTransform(78).ID = "F[Servo-Disc-6:-:Servo-disc-link_MX-28T-2]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(79).translation = [0 0 17.750000000000043];  % mm
smiData.RigidTransform(79).angle = 0;  % rad
smiData.RigidTransform(79).axis = [0 0 0];
smiData.RigidTransform(79).ID = "B[MX-28T-1:-:Servo-Disc-6]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(80).translation = [-2.8499999999998349 -6.2853476763546912e-14 -5.9690100084885955e-14];  % mm
smiData.RigidTransform(80).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(80).axis = [0.57735026918962573 0.57735026918962573 0.57735026918962562];
smiData.RigidTransform(80).ID = "F[MX-28T-1:-:Servo-Disc-6]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(81).translation = [1.9999999999999463 -6.7175144212721776 -6.7175144212722193];  % mm
smiData.RigidTransform(81).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(81).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(81).ID = "B[Servo-Disc-7:-:Servo-disc-link_MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(82).translation = [20.349999999999916 21.999999999999961 -38.000000000000043];  % mm
smiData.RigidTransform(82).angle = 2.5935642459694805;  % rad
smiData.RigidTransform(82).axis = [-0.67859834454584711 0.28108463771482084 -0.67859834454584678];
smiData.RigidTransform(82).ID = "F[Servo-Disc-7:-:Servo-disc-link_MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(83).translation = [0 0 17.749999999999989];  % mm
smiData.RigidTransform(83).angle = 0;  % rad
smiData.RigidTransform(83).axis = [0 0 0];
smiData.RigidTransform(83).ID = "B[MX-28T-2:-:Servo-Disc-7]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(84).translation = [-2.8499999999999486 1.1507591754500446e-13 -1.1636525076852422e-13];  % mm
smiData.RigidTransform(84).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(84).axis = [0.57735026918962595 0.57735026918962562 0.57735026918962562];
smiData.RigidTransform(84).ID = "F[MX-28T-2:-:Servo-Disc-7]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(85).translation = [0 0 -17.049999999995958];  % mm
smiData.RigidTransform(85).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(85).axis = [1 0 0];
smiData.RigidTransform(85).ID = "B[MX-28T-1:-:Servo-Disc-8]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(86).translation = [-0.20000000000403506 9.9163488835249392e-14 -4.8658559820280445e-14];  % mm
smiData.RigidTransform(86).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(86).axis = [0.57735026918962595 0.57735026918962573 0.57735026918962551];
smiData.RigidTransform(86).ID = "F[MX-28T-1:-:Servo-Disc-8]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(87).translation = [1.9999999999999463 -6.7175144212721918 6.7175144212721918];  % mm
smiData.RigidTransform(87).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(87).axis = [-0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(87).ID = "B[Servo-Disc-9:-:Servo-disc-link_MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(88).translation = [-21.499999999999847 19.21751442127227 -31.282485578727879];  % mm
smiData.RigidTransform(88).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(88).axis = [0.57735026918962618 0.57735026918962595 0.57735026918962518];
smiData.RigidTransform(88).ID = "F[Servo-Disc-9:-:Servo-disc-link_MX-28T-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(89).translation = [0 0 -17.049999999996011];  % mm
smiData.RigidTransform(89).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(89).axis = [1 0 0];
smiData.RigidTransform(89).ID = "B[MX-28T-2:-:Servo-Disc-9]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(90).translation = [-0.20000000000397783 2.827794422233243e-14 1.7899071981519743e-13];  % mm
smiData.RigidTransform(90).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(90).axis = [0.57735026918962562 0.57735026918962573 0.57735026918962573];
smiData.RigidTransform(90).ID = "F[MX-28T-2:-:Servo-Disc-9]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(91).translation = [55.101294679593387 113.75895405268302 122.07454716294822];  % mm
smiData.RigidTransform(91).angle = 0;  % rad
smiData.RigidTransform(91).axis = [0 0 0];
smiData.RigidTransform(91).ID = "RootGround[Base-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(92).translation = [253.36076926419938 -126.00513000193122 202.81587286720634];  % mm
smiData.RigidTransform(92).angle = 3.1405067039586152;  % rad
smiData.RigidTransform(92).axis = [-0.0017955018361407102 0.33727733593249815 0.94140361951685381];
smiData.RigidTransform(92).ID = "SixDofRigidTransform[Servo-Disc-8]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(22).mass = 0.0;
smiData.Solid(22).CoM = [0.0 0.0 0.0];
smiData.Solid(22).MoI = [0.0 0.0 0.0];
smiData.Solid(22).PoI = [0.0 0.0 0.0];
smiData.Solid(22).color = [0.0 0.0 0.0];
smiData.Solid(22).opacity = 0.0;
smiData.Solid(22).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.0022669635214453586;  % kg
smiData.Solid(1).CoM = [0.97661436740035124 0 0];  % mm
smiData.Solid(1).MoI = [0.19199819105797386 0.096747602260681145 0.096747602260681159];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Servo-Disc*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.19561170999999999;  % kg
smiData.Solid(2).CoM = [0.0036294547203052311 -15.72803389839771 0.46041747606699096];  % mm
smiData.Solid(2).MoI = [93.536763810740055 52.149211406744044 73.933306729302188];  % kg*mm^2
smiData.Solid(2).PoI = [-2.4036217245456806 0.0052267768495909148 -0.0037129011812466663];  % kg*mm^2
smiData.Solid(2).color = [0.058823529411764705 0.058823529411764705 0.058823529411764705];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "MX-106T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.02549027081513934;  % kg
smiData.Solid(3).CoM = [0 0.5 0];  % mm
smiData.Solid(3).MoI = [19.378030830698147 38.748477390903993 19.374690925008306];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Base-disc*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.0039095056304818522;  % kg
smiData.Solid(4).CoM = [-4.4999999999999298 14.999999999999996 -1.1203296524595061];  % mm
smiData.Solid(4).MoI = [0.30822167961157926 0.64706292001102095 0.92163407867759528];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Servo-link-link_MX-106T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.0035855056304818513;  % kg
smiData.Solid(5).CoM = [-6.4999999999999334 14.999999999999998 -1.2215669240763691];  % mm
smiData.Solid(5).MoI = [0.28011136124393932 0.48613480307392082 0.73353646872843947];  % kg*mm^2
smiData.Solid(5).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(5).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = "Servo-link-link_MX-28T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(6).mass = 0.65593512237157114;  % kg
smiData.Solid(6).CoM = [0 -5.2418387143947429 -1.9384500945807714];  % mm
smiData.Solid(6).MoI = [2012.7951810780301 3251.2643974183306 2052.3099399021639];  % kg*mm^2
smiData.Solid(6).PoI = [13.02247232075587 0 0];  % kg*mm^2
smiData.Solid(6).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(6).opacity = 1;
smiData.Solid(6).ID = "Base*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(7).mass = 0.0086440413403225096;  % kg
smiData.Solid(7).CoM = [6.150000000000083 12.499999999999996 -10.526227736498392];  % mm
smiData.Solid(7).MoI = [1.7786292104403487 6.1848717997336484 5.3446742483731535];  % kg*mm^2
smiData.Solid(7).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(7).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(7).opacity = 1;
smiData.Solid(7).ID = "Servo-disc-link_MX-106T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(8).mass = 0.022790628547627794;  % kg
smiData.Solid(8).CoM = [0 7.6331491587331328 0.83741329602527725];  % mm
smiData.Solid(8).MoI = [42.813278852128889 44.610484991882458 4.26579813472366];  % kg*mm^2
smiData.Solid(8).PoI = [0.015264625291902964 0 0];  % kg*mm^2
smiData.Solid(8).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(8).opacity = 1;
smiData.Solid(8).ID = "Link-1*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(9).mass = 0.096388378599999991;  % kg
smiData.Solid(9).CoM = [-4.9207660184937115e-06 -11.515527780961547 -0.031786961811860269];  % mm
smiData.Solid(9).MoI = [27.164585570374296 16.677802875978788 23.015011739517362];  % kg*mm^2
smiData.Solid(9).PoI = [-0.40717222308134138 1.1831857898853264e-05 6.3971751373782053e-07];  % kg*mm^2
smiData.Solid(9).color = [0.058823529411764705 0.058823529411764705 0.058823529411764705];
smiData.Solid(9).opacity = 1;
smiData.Solid(9).ID = "MX-28T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(10).mass = 0.013346673572331711;  % kg
smiData.Solid(10).CoM = [0 8.4412399976342858 0.19066099396353919];  % mm
smiData.Solid(10).MoI = [8.0927443325287332 9.3033608525781979 2.7965003584432786];  % kg*mm^2
smiData.Solid(10).PoI = [0.0040916240890221259 0 0];  % kg*mm^2
smiData.Solid(10).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(10).opacity = 1;
smiData.Solid(10).ID = "Link-2*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(11).mass = 0.0028825008972002274;  % kg
smiData.Solid(11).CoM = [0 0 0.5];  % mm
smiData.Solid(11).MoI = [0.14941972597400324 0.48188568106851432 0.63082499022631755];  % kg*mm^2
smiData.Solid(11).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(11).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(11).opacity = 1;
smiData.Solid(11).ID = "Link-plate*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(12).mass = 0.0012738283478637804;  % kg
smiData.Solid(12).CoM = [0 0.5 0];  % mm
smiData.Solid(12).MoI = [0.15484005933923634 0.17200066357832686 0.017372908963734526];  % kg*mm^2
smiData.Solid(12).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(12).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(12).opacity = 1;
smiData.Solid(12).ID = "MX-28T-Link*:*Default";




%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(13).mass = 0.00083961611905383662;  % kg
smiData.Solid(13).CoM = [0.97661436740035101 0 0];  % mm
smiData.Solid(13).MoI = [0.071110441132582941 0.03583244528173378 0.03583244528173378];  % kg*mm^2
smiData.Solid(13).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(13).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(13).opacity = 1;
smiData.Solid(13).ID = "servo-disc_default_sldprt.step*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(14).mass = 0.017333014466805727;  % kg
smiData.Solid(14).CoM = [3.8602206826003043 12.500000000000036 36.961667661683776];  % mm
smiData.Solid(14).MoI = [15.301194404128674 16.24396556346991 2.7145027633219589];  % kg*mm^2
smiData.Solid(14).PoI = [0 2.6954817954550401 0];  % kg*mm^2
smiData.Solid(14).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(14).opacity = 1;
smiData.Solid(14).ID = "Finger*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(15).mass = 0.018000000000000002;  % kg
smiData.Solid(15).CoM = [6.149999999999995 12.500000000000016 -10.526227736498377];  % mm
smiData.Solid(15).MoI = [3.7037451034138309 12.879125401204053 11.129532204102958];  % kg*mm^2
smiData.Solid(15).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(15).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(15).opacity = 1;
smiData.Solid(15).ID = "servo-disc-link_mx-106t_default_sldprt.step*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(16).mass = 0.0014479650483266119;  % kg
smiData.Solid(16).CoM = [-4.5000000000000036 14.999999999999998 -1.1203296524595054];  % mm
smiData.Solid(16).MoI = [0.11415617763391825 0.23965293333741516 0.34134595506577597];  % kg*mm^2
smiData.Solid(16).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(16).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(16).opacity = 1;
smiData.Solid(16).ID = "servo-link-link_mx-106t_default_sldprt.step*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(17).mass = 0.0077785778411459628;  % kg
smiData.Solid(17).CoM = [-0.57499999999993978 12.499999999999993 -11.697401449226398];  % mm
smiData.Solid(17).MoI = [1.6268186003975948 3.8970317287224718 3.1182960071232575];  % kg*mm^2
smiData.Solid(17).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(17).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(17).opacity = 1;
smiData.Solid(17).ID = "Servo-disc-link_MX-28T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(18).mass = 0.00092909911555884598;  % kg
smiData.Solid(18).CoM = [-46.056217810725308 -4.3040169304981424 -6.1156710991757119];  % mm
smiData.Solid(18).MoI = [0.0800889481088983 0.022092608617060968 0.058151189344430476];  % kg*mm^2
smiData.Solid(18).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(18).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(18).opacity = 1;
smiData.Solid(18).ID = "connection plate m28*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(19).mass = 0.17009713900000001;  % kg
smiData.Solid(19).CoM = [1.1288218934808353e-08 -15.203481847325202 0.45225693861280181];  % mm
smiData.Solid(19).MoI = [70.095398659614361 39.846453429011369 58.501037407669088];  % kg*mm^2
smiData.Solid(19).PoI = [-2.0688024459748724 4.7677246070726804e-08 -9.3378993115599092e-07];  % kg*mm^2
smiData.Solid(19).color = [0.058823529411764705 0.058823529411764705 0.058823529411764705];
smiData.Solid(19).opacity = 1;
smiData.Solid(19).ID = "MX-64T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(20).mass = 0.0039095056304818522;  % kg
smiData.Solid(20).CoM = [-4.4999999999999298 14.999999999999996 -1.1203296524595068];  % mm
smiData.Solid(20).MoI = [0.30822167961157937 0.64706292001102095 0.9216340786775955];  % kg*mm^2
smiData.Solid(20).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(20).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(20).opacity = 1;
smiData.Solid(20).ID = "Servo-link-link_MX-64T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(21).mass = 0.0082862913403225196;  % kg
smiData.Solid(21).CoM = [3.5000000000000706 12.500000000000002 -10.980684117292967];  % mm
smiData.Solid(21).MoI = [1.7186159866796078 5.1868693418407839 4.3694193892410302];  % kg*mm^2
smiData.Solid(21).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(21).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(21).opacity = 1;
smiData.Solid(21).ID = "Servo-disc-link_MX-64T*:*Default";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(22).mass = 0.16;  % kg
smiData.Solid(22).CoM = [0.0036290889378212828 -15.728032758689256 0.46041910480271542];  % mm
smiData.Solid(22).MoI = [76.508107476344648 42.655284346193447 60.473522138495234];  % kg*mm^2
smiData.Solid(22).PoI = [-1.9660318266960604 0.0042743196410630754 -0.0030345064934784753];  % kg*mm^2
smiData.Solid(22).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(22).opacity = 1;
smiData.Solid(22).ID = "mx-106t_default_sldprt.step*:*Default";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the CylindricalJoint structure array by filling in null values.
smiData.CylindricalJoint(5).Rz.Pos = 0.0;
smiData.CylindricalJoint(5).Pz.Pos = 0.0;
smiData.CylindricalJoint(5).ID = "";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(1).Rz.Pos = -179.99999999999793;  % deg
smiData.CylindricalJoint(1).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(1).ID = "[Servo-Disc-17:-:Servo-disc-link_MX-64T-2]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(2).Rz.Pos = -90.000000000000142;  % deg
smiData.CylindricalJoint(2).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(2).ID = "[MX-28T-2:-:MX-28T-Link-1]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(3).Rz.Pos = 134.98261517091581;  % deg
smiData.CylindricalJoint(3).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(3).ID = "[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(4).Rz.Pos = 1.9440504759367253e-10;  % deg
smiData.CylindricalJoint(4).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(4).ID = "[Servo-Disc-2:-:Servo-disc-link_MX-106T-2]";

%This joint has been chosen as a cut joint. Simscape Multibody treats cut joints as algebraic constraints to solve closed kinematic loops. The imported model does not use the state target data for this joint.
smiData.CylindricalJoint(5).Rz.Pos = -179.99999999999983;  % deg
smiData.CylindricalJoint(5).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(5).ID = "[Servo-Disc-9:-:Servo-disc-link_MX-28T-1]";


%Initialize the PrismaticJoint structure array by filling in null values.
smiData.PrismaticJoint(12).Pz.Pos = 0.0;
smiData.PrismaticJoint(12).ID = "";

smiData.PrismaticJoint(1).Pz.Pos = 0;  % m
smiData.PrismaticJoint(1).ID = "[Link-1-1:-:Link-plate-1]";

smiData.PrismaticJoint(2).Pz.Pos = 0;  % m
smiData.PrismaticJoint(2).ID = "[Servo-disc-link_MX-106T-2:-:Link-1-1]";

smiData.PrismaticJoint(3).Pz.Pos = 0;  % m
smiData.PrismaticJoint(3).ID = "[Servo-disc-link_MX-64T-2:-:Link-plate-3]";

smiData.PrismaticJoint(4).Pz.Pos = 0;  % m
smiData.PrismaticJoint(4).ID = "[Servo-disc-link_MX-28T-1:-:Finger-1]";

smiData.PrismaticJoint(5).Pz.Pos = 0;  % m
smiData.PrismaticJoint(5).ID = "[Servo-disc-link_MX-28T-2:-:Finger-2]";

smiData.PrismaticJoint(6).Pz.Pos = 0;  % m
smiData.PrismaticJoint(6).ID = "[Servo-Disc-16:-:Servo-disc-link_MX-64T-2]";

smiData.PrismaticJoint(7).Pz.Pos = 0;  % m
smiData.PrismaticJoint(7).ID = "[MX-28T-1:-:MX-28T-Link-1]";

smiData.PrismaticJoint(8).Pz.Pos = 0;  % m
smiData.PrismaticJoint(8).ID = "[Servo-link-link_MX-106T-1:-:MX-106T-2]";

smiData.PrismaticJoint(9).Pz.Pos = 0;  % m
smiData.PrismaticJoint(9).ID = "[MX-64T-2:-:Servo-link-link_MX-64T-2]";

smiData.PrismaticJoint(10).Pz.Pos = 0;  % m
smiData.PrismaticJoint(10).ID = "[Servo-Disc-3:-:Servo-disc-link_MX-106T-2]";

smiData.PrismaticJoint(11).Pz.Pos = 0;  % m
smiData.PrismaticJoint(11).ID = "[Servo-Disc-6:-:Servo-disc-link_MX-28T-2]";

smiData.PrismaticJoint(12).Pz.Pos = 0;  % m
smiData.PrismaticJoint(12).ID = "[Servo-Disc-7:-:Servo-disc-link_MX-28T-1]";


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(17).Rz.Pos = 0.0;
smiData.RevoluteJoint(17).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 3.2187213376410777e-12;  % deg
smiData.RevoluteJoint(1).ID = "[Link-2-1:-:servo-disc-link_mx-106t_default_sldprt.step-1]";

smiData.RevoluteJoint(2).Rz.Pos = 12.698149740881581;  % deg
smiData.RevoluteJoint(2).ID = "[MX-106T-1:-:Base-disc-1]";

smiData.RevoluteJoint(3).Rz.Pos = 20.478312740680416;  % deg
smiData.RevoluteJoint(3).ID = "[MX-28T-4:-:Servo-Disc-14]";

smiData.RevoluteJoint(4).Rz.Pos = 42.089895142515395;  % deg
smiData.RevoluteJoint(4).ID = "[MX-28T-4:-:Servo-Disc-15]";

smiData.RevoluteJoint(5).Rz.Pos = 0.11585740329830951;  % deg
smiData.RevoluteJoint(5).ID = "[MX-64T-2:-:Servo-Disc-16]";

smiData.RevoluteJoint(6).Rz.Pos = -179.88414259669969;  % deg
smiData.RevoluteJoint(6).ID = "[MX-64T-2:-:Servo-Disc-17]";

smiData.RevoluteJoint(7).Rz.Pos = 134.87909669918704;  % deg
smiData.RevoluteJoint(7).ID = "[MX-28T-5:-:Servo-Disc-20]";

smiData.RevoluteJoint(8).Rz.Pos = 179.99999999999994;  % deg
smiData.RevoluteJoint(8).ID = "[Servo-link-link_MX-28T-1:-:MX-28T-1]";

smiData.RevoluteJoint(9).Rz.Pos = 179.99999999999977;  % deg
smiData.RevoluteJoint(9).ID = "[Servo-link-link_MX-28T-1:-:MX-28T-2]";

smiData.RevoluteJoint(10).Rz.Pos = 135.0000000000025;  % deg
smiData.RevoluteJoint(10).ID = "[servo-disc-link_mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-1]";

smiData.RevoluteJoint(11).Rz.Pos = 179.98261517091689;  % deg
smiData.RevoluteJoint(11).ID = "[mx-106t_default_sldprt.step-1:-:servo-disc_default_sldprt.step-2]";

smiData.RevoluteJoint(12).Rz.Pos = -90.147129489144547;  % deg
smiData.RevoluteJoint(12).ID = "[MX-106T-2:-:Servo-Disc-2]";

smiData.RevoluteJoint(13).Rz.Pos = 90.14712948933871;  % deg
smiData.RevoluteJoint(13).ID = "[MX-106T-2:-:Servo-Disc-3]";

smiData.RevoluteJoint(14).Rz.Pos = -90.529298779971455;  % deg
smiData.RevoluteJoint(14).ID = "[MX-28T-1:-:Servo-Disc-6]";

smiData.RevoluteJoint(15).Rz.Pos = 135.97930609664849;  % deg
smiData.RevoluteJoint(15).ID = "[MX-28T-2:-:Servo-Disc-7]";

smiData.RevoluteJoint(16).Rz.Pos = -50.605592567711192;  % deg
smiData.RevoluteJoint(16).ID = "[MX-28T-1:-:Servo-Disc-8]";

smiData.RevoluteJoint(17).Rz.Pos = 179.02069390335168;  % deg
smiData.RevoluteJoint(17).ID = "[MX-28T-2:-:Servo-Disc-9]";


%Initialize the SixDofJoint structure array by filling in null values.
smiData.SixDofJoint(2).Px.Pos = 0.0;
smiData.SixDofJoint(2).Py.Pos = 0.0;
smiData.SixDofJoint(2).Pz.Pos = 0.0;
smiData.SixDofJoint(2).S.Pos.Angle = 0.0;
smiData.SixDofJoint(2).S.Pos.Axis = [0.0 0.0 0.0];
smiData.SixDofJoint(2).ID = "";

smiData.SixDofJoint(1).Px.Pos = 0;  % mm
smiData.SixDofJoint(1).Py.Pos = 0;  % mm
smiData.SixDofJoint(1).Pz.Pos = 0;  % mm
smiData.SixDofJoint(1).S.Pos.Angle = 1.0548706503622818e-14;  % deg
smiData.SixDofJoint(1).S.Pos.Axis = [-0.30151134457776363 -0.30151134457776363 -0.90453403373329089];
smiData.SixDofJoint(1).ID = "ConstraintSixDof[Parallel]";

smiData.SixDofJoint(2).Px.Pos = -1.4224965575113364e-14;  % mm
smiData.SixDofJoint(2).Py.Pos = 2.7726561113344727e-14;  % mm
smiData.SixDofJoint(2).Pz.Pos = -6.2153134995505124e-15;  % mm
smiData.SixDofJoint(2).S.Pos.Angle = 1.1900545917936401e-14;  % deg
smiData.SixDofJoint(2).S.Pos.Axis = [0.53452248382484879 -0.80178372573727319 -0.2672612419124244];
smiData.SixDofJoint(2).ID = "ConstraintSixDof[Parallel1]";

