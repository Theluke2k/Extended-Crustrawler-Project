#ifndef STRUCTURES_H    // If STRUCTURES_H has not been defined yet,
#define STRUCTURES_H    // define STRUCTURES_H

struct Optimizer {
  double c1;
  double c2;
  double c3;
  double c4;
  double c5;
  double c6;
  double s1;
  double s2;
  double s3;
  double s4;
  double s5;
  double s6;
  double c1_2;
  double c2_2;
  double c3_2;
  double c4_2;
  double c5_2;
  double c6_2;
};

enum MotorType {
  MX_28,
  MX_64,
  MX_106
};

// For general handling of motors
struct MotorState {
  float q = 0;
  float qd = 0;
  float qdd = 0;
};

struct Motor {
  uint8_t ID = 0;
  double offset = 0;
  float PWM = 0;
  MotorState state;
  MotorState desiredState;
  MotorType type;

  // Constructor
  Motor(uint8_t initID, MotorType initMotorType, int init_offset = 0) : ID(initID), type(initMotorType), offset(init_offset) {}
};

struct Pos {
  double t1;
  double t2;
  double t3;
  double t4;
  double t5;
  double t6;
};

struct Vel {
  double td1;
  double td2;
  double td3;
  double td4;
  double td5;
  double td6;
};

struct Acc {
  double tdd1;
  double tdd2;
  double tdd3;
  double tdd4;
  double tdd5;
  double tdd6;
};

struct CubicCoef {
  double a0 = 0;
  double a1 = 0;
  double a2 = 0;
  double a3 = 0;
};

struct Trajectory {
  int numberOfViaPoints = 0;
  double times[100] = {0};
  double positions[100] = {0};
  double velocities[100] = {0};
  double timeOffsets[100] = {0};
  CubicCoef CubicCoefs[100];
  

  // Constructor
  Trajectory(uint8_t initNumberOfViaPoints) : numberOfViaPoints(initNumberOfViaPoints) {}
};

struct JointTrajectoryCoef {
  CubicCoef J1;
  CubicCoef J2;
  CubicCoef J3;
  CubicCoef J4;
  CubicCoef J5;
  CubicCoef J6;
};

#endif // STRUCTURES_H