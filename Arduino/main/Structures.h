#ifndef STRUCTURES_H    // If STRUCTURES_H has not been defined yet,
#define STRUCTURES_H    // define STRUCTURES_H

struct Optimizer {
  float c1;
  float c2;
  float c3;
  float c4;
  float c5;
  float c6;
  float s1;
  float s2;
  float s3;
  float s4;
  float s5;
  float s6;
  float c1_2;
  float c2_2;
  float c3_2;
  float c4_2;
  float c5_2;
  float c6_2;
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
  float input = 0;
  MotorState state;
  MotorState desiredState;
  MotorType type;
  uint16_t model;
  int mode;
  float lowerLimit = 0;
  float higherLimit = 0;

  // Constructor
  Motor(uint8_t initID, MotorType initMotorType, uint16_t initModel, int initMode, float initLowerLimit, float initHigherLimit, int init_offset = 0) : ID(initID), type(initMotorType), model(initModel), mode(initMode), lowerLimit(initLowerLimit), higherLimit(initHigherLimit), offset(init_offset) {}
};

struct Pos {
  float t1;
  float t2;
  float t3;
  float t4;
  float t5;
  float t6;
};

struct Vel {
  float td1;
  float td2;
  float td3;
  float td4;
  float td5;
  float td6;
};

struct Acc {
  float tdd1;
  float tdd2;
  float tdd3;
  float tdd4;
  float tdd5;
  float tdd6;
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