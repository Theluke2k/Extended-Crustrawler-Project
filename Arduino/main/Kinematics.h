#ifndef KINEMATICS_H    // If STRUCTURES_H has not been defined yet,
#define KINEMATICS_H    // define STRUCTURES_H

#include <BasicLinearAlgebra.h>

bool validInput = false;

float a2 = 0.222;
float d4 = 0.198;
float d6 = 0.24;

/* ----- FORWARD KINEMATIC EQUATIONS ----- */
BLA::Matrix<3> getEEPosition(BLA::Matrix<6> q) {
  BLA::Matrix<3> pos;
  pos(0) = a2 * cos(q(0)) * cos(q(1)) + d4 * cos(q(0)) * sin(q(1) + q(2)) + d6 * (cos(q(0)) * (cos(q(1) + q(2)) * cos(q(3)) * sin(q(4)) + sin(q(1) + q(2)) * cos(q(4))) + sin(q(0)) * sin(q(3)) * sin(q(4)));
  pos(1) = a2 * sin(q(0)) * cos(q(1)) + d4 * sin(q(0)) * sin(q(1) + q(2)) + d6 * (sin(q(0)) * (cos(q(1) + q(2)) * cos(q(3)) * sin(q(4)) + sin(q(1) + q(2)) * cos(q(4))) - cos(q(0)) * sin(q(3)) * sin(q(4)));
  pos(2) = a2 * sin(q(1)) - d4 * cos(q(1) + q(2)) + d6 * (sin(q(1) + q(2)) * cos(q(3)) * sin(q(4)) - cos(q(1) + q(2)) * cos(q(4)));

  return pos;
}

BLA::Matrix<3, 3> getEEOrientation(BLA::Matrix<6> q) {
  BLA::Matrix<3, 3> ori;
  ori(0, 0) = cos(q(0)) * (cos(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * cos(q(5)) - sin(q(3)) * sin(q(5))) - sin(q(1) + q(2)) * sin(q(4)) * cos(q(5))) + sin(q(0)) * (sin(q(3)) * cos(q(4)) * cos(q(5)) + cos(q(3)) * sin(q(5)));
  ori(1, 0) = sin(q(0)) * (cos(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * cos(q(5)) - sin(q(3)) * sin(q(5))) - sin(q(1) + q(2)) * sin(q(4)) * cos(q(5))) - cos(q(0)) * (sin(q(3)) * cos(q(4)) * cos(q(5)) + cos(q(3)) * sin(q(5)));
  ori(2, 0) = sin(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * cos(q(5)) - sin(q(3)) * sin(q(5))) + cos(q(1) + q(2)) * sin(q(4)) * cos(q(5));
  ori(0, 1) = cos(q(0)) * ((-cos(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * sin(q(5)) + sin(q(3)) * cos(q(5)))) + sin(q(1) + q(2)) * sin(q(4)) * sin(q(5))) + sin(q(0)) * ((-sin(q(3)) * cos(q(4)) * sin(q(5)) + cos(q(3)) * cos(q(5))));
  ori(1, 1) = sin(q(0)) * ((-cos(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * sin(q(5)) + sin(q(3)) * cos(q(5)))) + sin(q(1) + q(2)) * sin(q(4)) * sin(q(5))) - cos(q(0)) * ((-sin(q(3)) * cos(q(4)) * sin(q(5)) + cos(q(3)) * cos(q(5))));
  ori(2, 1) = -sin(q(1) + q(2)) * (cos(q(3)) * cos(q(4)) * sin(q(5)) + sin(q(3)) * cos(q(5))) - cos(q(1) + q(2)) * sin(q(4)) * sin(q(5));
  ori(0, 2) = cos(q(0)) * (cos(q(1) + q(2)) * cos(q(3)) * sin(q(4)) + sin(q(1) + q(2)) * cos(q(4))) + sin(q(0)) * sin(q(3)) * sin(q(4));
  ori(1, 2) = sin(q(0)) * (cos(q(1) + q(2)) * cos(q(3)) * sin(q(4)) + sin(q(1) + q(2)) * cos(q(4))) - cos(q(0)) * sin(q(3)) * sin(q(4));
  ori(2, 2) = sin(q(1) + q(2)) * cos(q(3)) * sin(q(4)) - cos(q(1) + q(2)) * cos(q(4));

  return ori;
}

BLA::Matrix<3, 3> convertEuler2Matrix(float a, float b, float y) {
  BLA::Matrix<3, 3> R;

  R(0, 0) = cos(a) * cos(b);
  R(0, 1) = cos(a) * sin(b) * sin(y) - sin(a) * cos(y);
  R(0, 2) = cos(a) * sin(b) * cos(y) + sin(a) * sin(y);
  R(1, 0) = sin(a) * cos(b);
  R(1, 1) = sin(a) * sin(b) * sin(y) + cos(a) * cos(y);
  R(1, 2) = sin(a) * sin(b) * cos(y) - cos(a) * sin(y);
  R(2, 0) = -sin(b);
  R(2, 1) = cos(b) * sin(y);
  R(2, 2) = cos(b) * cos(y);

  return R;
}

BLA::Matrix<3> convertMatrix2Euler(BLA::Matrix<3, 3> R) {
  BLA::Matrix<3> euler;

  euler(0) = atan2(R(1, 0), R(0, 0));
  euler(1) = atan2(-R(2, 0), sqrt(R(2, 1)*R(2, 1) + R(2, 2)*R(2, 2)));
  euler(2) = atan2(R(2, 1), R(2, 2));

  return euler;
}

/* ----- HOMOGENEOUS TRANSFORMATIONS ----- */

BLA::Matrix<4,4> getT01(float t1) {
  BLA::Matrix<4,4> T01 = { cos(t1),0,sin(t1),0,sin(t1),0,-cos(t1),0,0,1,0,0,0,0,0,1 };
  return T01;
}
BLA::Matrix<4,4> getT12(float t2) {
  BLA::Matrix<4,4> T12 = { cos(t2),-sin(t2),0,a2*cos(t2),sin(t2),cos(t2),0,a2*sin(t2),0,0,1,0,0,0,0,1 };
  return T12;
}
BLA::Matrix<4,4> getT23(float t3) {
  BLA::Matrix<4,4> T23 = { cos(t3),0,sin(t3),0,sin(t3),0,-cos(t3),0,0,1,0,0,0,0,0,1 };
  return T23;
}
BLA::Matrix<4,4> getT34(float t4) {
  BLA::Matrix<4,4> T34 = { cos(t4),0,-sin(t4),0,sin(t4),0,cos(t4),0,0,-1,0,d4,0,0,0,1 };
  return T34;
}
BLA::Matrix<4,4> getT45(float t5) {
  BLA::Matrix<4,4> T45 = { cos(t5),0,sin(t5),0,sin(t5),0,-cos(t5),0,0,1,0,0,0,0,0,1 };
  return T45;
}
BLA::Matrix<4,4> getT56(float t6) {
  BLA::Matrix<4,4> T56 = { cos(t6),-sin(t6),0,0,sin(t6),cos(t6),0,0,0,0,1,d6,0,0,0,1 };
  return T56;
}

BLA::Matrix<6> InverseKinematics(double p1, double p2, double p3, BLA::Matrix<3, 3> R06, int choice1, int choice2) {
  // Just to keep same notation as the report
  double a3 = d4;
  /*
  Serial.println("InverseKinematics Input: ");
  Serial.println(p1);
  Serial.println(p2);
  Serial.println(p3);
  Serial << "R06 " << R06 << '\n';
  Serial.println(choice1);
  Serial.println(choice2);
  Serial.println();
*/
  // Returned vector of joint variables
  BLA::Matrix<6> q;

  BLA::Matrix<3> i_z;
  i_z.Fill(0);
  i_z(2) = 1;

  // Define position of end_effector
  BLA::Matrix<3> p_e;
  p_e(0) = p1;
  p_e(1) = p2;
  p_e(2) = p3;

  // Calculate position of the wrist
  BLA::Matrix<3> p_w;
  for (int i = 0; i < 3; i++) {
    p_w(i) = p_e(i) - d6 * (R06 * i_z)(i);
    //Serial.println(p_w(i));
  }

  double pwx = p_w(0);
  double pwy = p_w(1);
  double pwz = p_w(2);

  // Intermediate results for t3
  double c3 = (pow(pwx, 2) + pow(pwy, 2) + pow(pwz, 2) - pow(a2, 2) - pow(a3, 2)) / (2 * a2 * a3);
  double s3_I = sqrt(1 - pow(c3, 2));
  double s3_II = -sqrt(1 - pow(c3, 2));
  /*
  Serial.println(c3);
  Serial.println(s3_I);
  Serial.println(s3_II);
  Serial.println();
  */
  // Calculate possible solutions for t3
  double t3_I = atan2(s3_I, c3) + PI / 2;
  double t3_II = atan2(s3_II, c3) + PI / 2;
  /*
  Serial.println(t3_I);
  Serial.println(t3_II);
  Serial.println();
  */
  // Intermediate results for t2
  double c2_I = (sqrt(pow(pwx, 2) + pow(pwy, 2)) * (a2 + a3 * c3) + pwz * a3 * s3_I) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double c2_II = (-sqrt(pow(pwx, 2) + pow(pwy, 2)) * (a2 + a3 * c3) + pwz * a3 * s3_I) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double c2_III = (sqrt(pow(pwx, 2) + pow(pwy, 2)) * (a2 + a3 * c3) + pwz * a3 * s3_II) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double c2_IIII = (-sqrt(pow(pwx, 2) + pow(pwy, 2)) * (a2 + a3 * c3) + pwz * a3 * s3_II) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  /*
  Serial.println(c2_I);
  Serial.println(c2_II);
  Serial.println(c2_III);
  Serial.println(c2_IIII);
  Serial.println();
  */
  double s2_I = (pwz * (a2 + a3 * c3) - sqrt(pow(pwx, 2) + pow(pwy, 2)) * a3 * s3_I) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double s2_II = (pwz * (a2 + a3 * c3) + sqrt(pow(pwx, 2) + pow(pwy, 2)) * a3 * s3_I) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double s2_III = (pwz * (a2 + a3 * c3) - sqrt(pow(pwx, 2) + pow(pwy, 2)) * a3 * s3_II) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  double s2_IIII = (pwz * (a2 + a3 * c3) + sqrt(pow(pwx, 2) + pow(pwy, 2)) * a3 * s3_II) / (pow(a2, 2) + pow(a3, 2) + 2 * a2 * a3 * c3);
  /*
  Serial.println(s2_I);
  Serial.println(s2_II);
  Serial.println(s2_III);
  Serial.println(s2_IIII);
  Serial.println();
  */
  // Possible solutions for t2
  double t2_I = atan2(s2_I, c2_I);
  double t2_II = atan2(s2_II, c2_II);
  double t2_III = atan2(s2_III, c2_III);
  double t2_IIII = atan2(s2_IIII, c2_IIII);
  /*
  Serial.println(t2_I);
  Serial.println(t2_II);
  Serial.println(t2_III);
  Serial.println(t2_IIII);
  Serial.println();
  */
  // Calculate possible solutions for t1
  double t1_I = atan2(pwy, pwx);
  double t1_II = atan2(-pwy, -pwx);
  /*
  Serial.println(t1_I);
  Serial.println(t1_II);
  Serial.println();
  */
  // Logic to choose one of the solutions
  if (choice1 == 1) {
    q(0) = t1_I;
    q(1) = t2_I;
    q(2) = t3_I;
  } else if (choice1 == 2) {
    q(0) = t1_I;
    q(1) = t2_III;
    q(2) = t3_II;
  } else if (choice1 == 3) {
    q(0) = t1_II;
    q(1) = t2_II;
    q(2) = t3_I;
  } else {
    q(0) = t1_II;
    q(1) = t2_IIII;
    q(2) = t3_II;
  }

  // Solve orientation
  // To keep consistent notation (because it was converted from MATLAB)
  double t1 = q(0);
  double t2 = q(1);
  double t3 = q(2);
  /*
  Serial.println(t1,5);
  Serial.println(t2,5);
  Serial.println(t3,5);
  Serial.println();
  */
  BLA::Matrix<4,4> T03 = getT01(t1) * getT12(t2) * getT23(t3);

  //Serial << "T03 " << T03 << '\n';

  // Extract rotation matrix from homogeneous transformation
  BLA::Matrix<3,3> R03;
  for(int i = 0; i < 3; i++) {
    for(int j = 0; j < 3; j++) {
      R03(i,j) = T03(i,j);
    }
  }
  //Serial << "R03 " << R03 << '\n';

  // Calculate R36
  BLA::Matrix<3,3> R36 = ~R03 * R06;

  //Serial << "R36 " << R36 << '\n';

  // Keep notationa from MATLAB script
  float nz3 = R36(2,0);
  float sz3 = R36(2,1);
  float ax3 = R36(0,2);
  float ay3 = R36(1,2);
  float az3 = R36(2,2);
  /*
  Serial.println(nz3);
  Serial.println(sz3);
  Serial.println(ax3);
  Serial.println(ay3);
  Serial.println(az3);
  Serial.println();
  */
  // Possible solutions
  float t4_I = atan2(ay3, ax3);
  float t5_I = atan2(sqrt(pow(ax3, 2) + pow(ay3, 2)), az3);
  float t6_I = atan2(sz3, -nz3);

  float t4_II = atan2(-ay3, -ax3);
  float t5_II = atan2(-sqrt(pow(ax3, 2) + pow(ay3, 2)), az3);
  float t6_II = atan2(-sz3, nz3);
  /*
  Serial.println(t4_I);
  Serial.println(t5_I);
  Serial.println(t6_I);
  Serial.println(t4_II);
  Serial.println(t5_II);
  Serial.println(t6_II);
  Serial.println();
  */

  if(choice2 == 1) {
    q(3) = t4_I;
    q(4) = t5_I;
    q(5) = t6_I;
  }
  else {
    q(3) = t4_II;
    q(4) = t5_II;
    q(5) = t6_II;
  }

  return q;
}

#endif // KINEMATICS_H