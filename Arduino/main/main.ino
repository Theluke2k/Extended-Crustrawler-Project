#include <Dynamixel2Arduino.h>
#include <math.h>
#include <BasicLinearAlgebra.h>
#include "Dynamics.h"
#include "Structures.h"


#define DXL_SERIAL Serial1
#define DEBUG_SERIAL Serial
const int DXL_DIR_PIN = 2;  // DYNAMIXEL Shield DIR PIN
const float DXL_PROTOCOL_VERSION = 2.0;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

// Define custom pins for UART
#define RX1 21
#define TX1 22

//This namespace is required to use Control table item names
using namespace ControlTableItem;
using namespace DYNAMIXEL;

// Namespace for linear algebra
using namespace BLA;

// To create diagonal matrices
template<int Dim, typename DType = float>
struct DiagonalMatrix : public MatrixBase<DiagonalMatrix<Dim>, Dim, Dim, DType> {
  Matrix<Dim, 1, DType> diagonal;

  // For const matrices (ones whose elements can't be modified) you just need to implement this function:
  DType operator()(int row, int col) const {
    // If it's on the diagonal and it's not larger than the matrix dimensions then return the element
    if (row == col)
      return diagonal(row);
    else
      // Otherwise return zero
      return 0.0f;
  }

  // If you want to declare a matrix whose elements can be modified then you'll need to define this function:
  // DType& operator()(int row, int col)
};

// Aplication sempahores
static SemaphoreHandle_t motorComms;

// Application specific variables
bool inMotionFlag = 0;
bool trajectoryReadyFlag = 0;
uint32_t motorTimeout = 5;
double MX_28_Constants[4] = { 211.7, 427.4, 642.0, 115.3 };
double MX_64_Constants[4] = { 80.9, 152.7, 224.5, 105.3 };
double MX_106_Constants[4] = { 40.4, 83.9, 127.5, 160.6 };
double* motorConstants[] = { MX_28_Constants, MX_64_Constants, MX_106_Constants };
float userPositions[100][6] = { 0 };
float userTimes[100] = { 0 };


/*
  Motor 1: 1030, 1
  Motor 2: 1029, 1
  Motor 3: 942, 1
  Motor 4: 978, 1
  Motor 5: 2020, 1
  Motor 6: 3458, 1
*/
/*
  Models numbers:
  MX28: 30
  MX64: 311
  MX106: 321
*/

// Initialize motors (ID;TYPE;MODEL;OPERATINGMODE;OFFSET)
Motor M1(1, MX_64, 311, OP_PWM, -1030.0);
Motor M2(2, MX_106, 321, OP_PWM, -1029.0);
Motor M3(3, MX_106, 321, OP_PWM, -942.0);
Motor M4(4, MX_28, 30, OP_PWM, -978.0);
Motor M5(5, MX_64, 311, OP_PWM, -2020.0);
Motor M6(6, MX_28, 30, OP_PWM, -3458.0);

Motor* M[6] = { &M1, &M2, &M3, &M4, &M5, &M6 };

// Initialize Trajectory planner with number of via points
Trajectory Tr1(3);
Trajectory Tr2(3);
Trajectory Tr3(3);
Trajectory Tr4(3);
Trajectory Tr5(3);
Trajectory Tr6(3);

Trajectory* Tr[6] = { &Tr1, &Tr2, &Tr3, &Tr4, &Tr5, &Tr6 };

void setup() {
  Serial.begin(2000000);
  Serial.println();

  // put your setup code here, to run once:
  Serial1.begin(4500000, SERIAL_8N1, RX1, TX1);

  // Set Port baudrate to 57600bps. This has to match with DYNAMIXEL baudrate.
  dxl.begin(4500000);

  // Set Port Protocol Version. This has to match with DYNAMIXEL protocol version.
  dxl.setPortProtocolVersion(DXL_PROTOCOL_VERSION);

  // Test used for time optimiation
  uint8_t recv_len, ret = 0;
  int x = micros();

  // Motor Setup
  for (int i = 0; i < 6; i++) {
    Serial.print("Ping: ");
    Serial.println(dxl.ping(M[i]->ID));

    // Serial.println("Calling Function...");
    //x = micros();
    //Serial.println(dxl.readControlTableItem((uint8_t)ID, (uint8_t)M[i]->ID));
    //Serial.println(micros() - x);

    dxl.torqueOff(M[i]->ID);
    dxl.writeControlTableItem((uint8_t)RETURN_DELAY_TIME, (uint8_t)M[i]->ID, (int32_t)80, motorTimeout);

    //Serial.println(dxl.readControlTableItem(BAUD_RATE, M[i]->ID));
    dxl.setOperatingMode(M[i]->ID, OP_PWM);

    // Print info
    Serial.print("Motor");
    Serial.println(i);
    Serial.println(dxl.readControlTableItem((uint8_t)OPERATING_MODE, (uint8_t)M[i]->ID, motorTimeout));
    Serial.println(dxl.readControlTableItem((uint8_t)RETURN_DELAY_TIME, (uint8_t)M[i]->ID, motorTimeout));

    dxl.torqueOn(M[i]->ID);
  }

  // Semaphore Creation
  motorComms = xSemaphoreCreateMutex();

  // Task Creation
  xTaskCreate(ControlTask, "Control Task", 50000, NULL, 1, NULL);
  xTaskCreate(TrajectoryPlanner, "Trajectory Planner", 40000, NULL, 1, NULL);
}

extern bool timeoutFlag;

/* ----- GENERAL FUNCTIONS -----*/
void getMotorState(Motor* M, int sensitivity) {
  double x = 0;
  xSemaphoreTake(motorComms, 1000);
  x = ((dxl.readControlTableItem((uint8_t)PRESENT_POSITION, M->ID, motorTimeout) + M->offset) / 4096.0) * 2 * PI;
  xSemaphoreGive(motorComms);
  if (timeoutFlag) {
    return;
  }
  if (abs(x - M->state.q) < sensitivity) {
    M->state.q = x;
  } else {
    Serial.print("Position change unaccpeted for motor: ");
    Serial.print(M->ID);
    Serial.print(" | Previous: ");
    Serial.print(M->state.q);
    Serial.print(" | Measured: ");
    Serial.print(x);
    Serial.print(" | Diff:  ");
    Serial.println(abs(x - M->state.q));
  }

  xSemaphoreTake(motorComms, 1000);
  x = ((dxl.readControlTableItem((uint8_t)PRESENT_VELOCITY, M->ID, (uint32_t)motorTimeout) * 0.229) / 60.0) * 2.0 * PI;
  xSemaphoreGive(motorComms);
  if (timeoutFlag) {
    return;
  }
  if (abs(x - M->state.qd) < sensitivity) {
    M->state.qd = x;
  } else {
    Serial.print("Velocity change unaccpeted for motor: ");
    Serial.print(M->ID);
    Serial.print(" | Previous: ");
    Serial.print(M->state.qd);
    Serial.print(" | Measured: ");
    Serial.print(x);
    Serial.print(" | Diff:  ");
    Serial.println(x - M->state.qd);
  }
}

//
void updateMotorState(Motor* M[6]) {
  for (int i = 0; i < 6; i++) {
    if (!timeoutFlag) {
      getMotorState(M[i], 10);
    }
  }
}

BLA::Matrix<6> getCurrentPositionVector(Motor* M[6]) {
  BLA::Matrix<6> v;
  for (int i = 0; i < 6; i++) {
    v(i) = M[i]->state.q;
  }
  return v;
}

BLA::Matrix<6> getCurrentVelocityVector(Motor* M[6]) {
  BLA::Matrix<6> v;
  for (int i = 0; i < 6; i++) {
    v(i) = M[i]->state.qd;
  }
  return v;
}

/*
  Inlining the functions eliminates function overhead and allows for the compiler to be more aggressive and thus optimizing the function. However, it increases the size of the binary
*/
__attribute__((always_inline)) void get_Cqd(double Arr[6], Pos* p, Vel* v, Optimizer* o) {
  Arr[0] = get_Cqd1(p, v, o);
  Arr[1] = get_Cqd2(p, v, o);
  Arr[2] = get_Cqd3(p, v, o);
  Arr[3] = get_Cqd4(p, v, o);
  Arr[4] = get_Cqd5(p, v, o);
  Arr[5] = get_Cqd6(p, v, o);
}
__attribute__((always_inline)) void get_g(double Arr[6], Pos* p, Optimizer* o) {
  Arr[0] = get_g1(p, o);
  Arr[1] = get_g2(p, o);
  Arr[2] = get_g3(p, o);
  Arr[3] = get_g4(p, o);
  Arr[4] = get_g5(p, o);
  Arr[5] = get_g6(p, o);
}
__attribute__((always_inline)) void get_Bqdd(double Arr[6], Pos* p, Acc* a, Optimizer* o) {
  Arr[0] = get_Bqdd1(p, a, o);
  Arr[1] = get_Bqdd2(p, a, o);
  Arr[2] = get_Bqdd3(p, a, o);
  Arr[3] = get_Bqdd4(p, a, o);
  Arr[4] = get_Bqdd5(p, a, o);
  Arr[5] = get_Bqdd6(p, a, o);
}

void getPWM(BLA::Matrix<6> tau) {
  double C1, C2 = 0;
  int motorType = 0;
  double pwm_test = 0;

  for (int i = 0; i < 6; i++) {
    // Get motor type
    motorType = M[i]->type;
    C2 = motorConstants[motorType][3];

    // Find constants
    if (tau(i) < 0) {
      if (M[i]->state.qd < 0) {
        C1 = motorConstants[motorType][2];
      } else if (M[i]->state.qd == 0) {
        C1 = motorConstants[motorType][1];
      } else {
        C1 = motorConstants[motorType][0];
      }
    } else {
      if (M[i]->state.qd < 0) {
        C1 = motorConstants[motorType][0];
      } else if (M[i]->state.qd == 0) {
        C1 = motorConstants[motorType][1];
      } else {
        C1 = motorConstants[motorType][2];
      }
    }

    pwm_test = C1 * tau(i) + M[i]->state.qd * C2;
    if (pwm_test > 885) {
      pwm_test = 885;
    }
    if (pwm_test < -855) {
      pwm_test = -885;
    }

    M[i]->input = pwm_test;
  }
}

void updateMotorInput(BLA::Matrix<6> tau, BLA::Matrix<6> g) {
  double C1, C2 = 0;
  int motorType = 0;
  double input_test = 0;

  for (int i = 0; i < 6; i++) {
    // Do nothing if a timeout was indicated
    if (!timeoutFlag) {
      // Chech the operating mode of the motor
      if (M[i]->mode == OP_CURRENT) {
        if (M[i]->type == MX_106) {
          M[i]->input = tau(i) * 133.33;
        } else if (M[i]->type == MX_64) {
          M[i]->input = tau(i) * 172.41;
        } else if (M[i]->type == MX_28) {
          Serial.println("INVALID MOTOR TYPE FOR CURRENT CONTROL");
        }

        // Write new current value to the motor
        xSemaphoreTake(motorComms, 1000);
        dxl.writeControlTableItem((uint8_t)GOAL_CURRENT, (uint8_t)M[i]->ID, (int32_t)M[i]->input, motorTimeout);
        xSemaphoreGive(motorComms);
      } else if (M[i]->mode == OP_PWM) {
        /*
          if: opposed by gravity.
          else if: assisted by gravity.
          else: not affected by gravity.
        */
        if (((tau(i) < 0) && (g(i) < 0)) || ((tau(i) > 0) && (g(i) > 0))) {
          input_test = tau(i) * motorConstants[motorType][2] + M[i]->state.qd * motorConstants[motorType][3];
        } else if (((tau(i) < 0) && (g(i) > 0)) || ((tau(i) > 0) && (g(i) < 0))) {
          input_test = tau(i) * motorConstants[motorType][0] + M[i]->state.qd * motorConstants[motorType][3];
        } else {
          input_test = tau(i) * motorConstants[motorType][1] + M[i]->state.qd * motorConstants[motorType][3];
        }

        // Limit the PWM value
        if (input_test > 885) {
          input_test = 885;
        }
        if (input_test < -855) {
          input_test = -885;
        }

        // Write the new PWM value to the motor
        xSemaphoreTake(motorComms, 1000);
        dxl.writeControlTableItem((uint8_t)GOAL_PWM, (uint8_t)M[i]->ID, (int32_t)M[i]->input, motorTimeout);
        xSemaphoreGive(motorComms);
      }
    }
  }
}

uint8_t UserInputListener() {
  if (Serial.available() > 0) {
    String input = Serial.readStringUntil('\n');
    input.trim();

    int innerIndex = 0;
    int startIndex = 0;
    int arrayIndex = 1;
    bool lastCharWasSpace = true;
    bool isPosition = 0;
    int offset = 0;

    for (int i = 0; i <= input.length(); i++) {
      // Check if we have reached the end of a number or the end of the input
      if (input.charAt(i) == ',') {
        isPosition = 1;
        arrayIndex = 1;
      } else if (i == input.length() || input.charAt(i) == ' ') {
        // Ensures that it still works if the user types more than 1 space between numbers
        if (!lastCharWasSpace) {
          // Extract number from string and convert to float
          String inputNumberString = input.substring(startIndex, i);
          float inputNumber = inputNumberString.toFloat();

          // Save number in userInput array
          if (isPosition) {
            userPositions[arrayIndex][innerIndex] = inputNumber;

            innerIndex++;

            // If the end of a path point is reached, reset innerIndex and increment outer index
            if (innerIndex >= 6) {
              innerIndex = 0;
              arrayIndex++;
            }
          } else {
            userTimes[arrayIndex] = inputNumber;
            arrayIndex++;
          }

          lastCharWasSpace = true;
        }
      } else {
        // Set startindex to i if the last characters was space
        if (lastCharWasSpace) {
          startIndex = i;
        }
        lastCharWasSpace = false;
      }

      // Break if user has input more than 100 via points
      if (arrayIndex >= 100) {
        break;
      }
      Serial.println("PRINT CHECK");
      for (int i = 1; i < arrayIndex; i++) {
        Serial.println(userTimes[i]);
        for (int j = 0; j < 6; j++) {
          Serial.println(userPositions[i][j]);
        }
      }
    }
    return 1;
  }
  return 0;
}

/* ----- UNUSED LOOP ----- */
void loop() {
  // Empty loop since the scheduler will handle the task execution
}


/* ----- TASKS ----- */
void ControlTask(void* pvParameters) {
  (void)pvParameters;
  TickType_t lastWakeTime = xTaskGetTickCount();

  // Controller Parameters
  double w_n[6] = { 15, 15, 15, 15, 15, 15 };  // natural frequency of system
  double z_n[6] = { 1, 1, 1, 1, 1, 1 };        // damping ratio of system

  // General Variables
  double timeCapture = 0;
  double inputTime = 0;
  double duration = 0;

  // Define some structs used for computational optimization
  Pos q_op;
  Vel qd_op;
  Acc y_op;
  Optimizer opt;

  // Arrays for joint variables for computational efficiency
  double CqdArr[6] = { 0, 0, 0, 0, 0, 0 };
  double gArr[6] = { 0, 0, 0, 0, 0, 0 };
  double BqddArr[6] = { 0, 0, 0, 0, 0, 0 };

  // Define Vectors
  BLA::Matrix<6> q = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> qd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> Cqd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> g = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> Bqdd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> y = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> tau = { 0, 0, 0, 0, 0, 0 };

  // Control system Reference
  BLA::Matrix<6> q_d = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> qd_d = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> qdd_d = { 0, 0, 0, 0, 0, 0 };

  // Control system error
  BLA::Matrix<6> q_e = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> qd_e = { 0, 0, 0, 0, 0, 0 };

  // Kp and Kd matrices
  DiagonalMatrix<6> Kp;
  DiagonalMatrix<6> Kd;
  Kp.diagonal.Fill(0);
  Kd.diagonal.Fill(0);
  Kp.diagonal = { w_n[0] * w_n[0], w_n[1] * w_n[1], w_n[2] * w_n[2], w_n[3] * w_n[3], w_n[4] * w_n[4], w_n[5] * w_n[5] };
  Kd.diagonal = { 2 * z_n[0] * w_n[0], 2 * z_n[1] * w_n[1], 2 * z_n[2] * w_n[2], 2 * z_n[3] * w_n[3], 2 * z_n[4] * w_n[4], 2 * z_n[5] * w_n[5] };

  while (1) {
    duration = micros();
    timeoutFlag = 0;
    // Read position and velocity of the motor
    updateMotorState(M);

    if (inMotionFlag && !timeoutFlag) {
      Serial.println(inMotionFlag);
      Serial.println(timeoutFlag);
      // Insert motor state in vector
      q = getCurrentPositionVector(M);
      qd = getCurrentVelocityVector(M);

      //Serial << "q: " << q << '\n';
      //Serial << "qd: " << qd << '\n';

      // Define some structs for computational optimization
      q_op = { q(0), q(1), q(2), q(3), q(4), q(5) };
      qd_op = { qd(0), qd(1), qd(2), qd(3), qd(4), qd(5) };
      opt = {
        cos(q_op.t1), cos(q_op.t2), cos(q_op.t3), cos(q_op.t4), cos(q_op.t5), cos(q_op.t6),
        sin(q_op.t1), sin(q_op.t2), sin(q_op.t3), sin(q_op.t4), sin(q_op.t5), sin(q_op.t6)
      };
      // Calculate centrifugal, Coriolis and gravitationla terms (very optimized)
      get_Cqd(CqdArr, &q_op, &qd_op, &opt);
      get_g(gArr, &q_op, &opt);
      //Insert in vectors
      for (int i = 0; i < 6; i++) {
        Cqd(i) = CqdArr[i];
        g(i) = gArr[i];
      }

      //Serial << "Cqd: " << Cqd << '\n';
      //Serial << "g: " << g << '\n';

      // Capture current time
      timeCapture = millis();

      // Calculate desired joint variables
      for (int i = 1; i < Tr1.numberOfViaPoints; i++) {
        // Find the current path period
        if (timeCapture < Tr1.timeOffsets[i]) {
          // Use cubic polynomials to define desired joint variables.
          for (int j = 0; j < 6; j++) {
            inputTime = (timeCapture - Tr1.timeOffsets[i - 1]) / 1000.0;
            q_d(j) = getDesiredJointPosition(inputTime, Tr[j]->CubicCoefs[i - 1]);
            qd_d(j) = getDesiredJointVelocity(inputTime, Tr[j]->CubicCoefs[i - 1]);
            qdd_d(j) = getDesiredJointAcceleration(inputTime, Tr[j]->CubicCoefs[i - 1]);
          }
          break;  // To prevent the loop executing the next cubic before time
        }
      }

      // Calculate control signal error
      q_e = q_d - q;
      qd_e = qd_d - qd;

      //Serial << "q_e: " << q_e << '\n';
      //Serial << "qd_e: " << qd_e << '\n';

      // Caluclate input to B(q)y block
      y = Kp * q_e + Kd * qd_e + qdd_d;
      y_op = { y(0), y(1), y(2), y(3), y(4), y(5) };

      // Calculate output of B(q)y block and store in vector
      get_Bqdd(BqddArr, &q_op, &y_op, &opt);
      for (int i = 0; i < 6; i++) {
        Bqdd(i) = BqddArr[i];
      }

      //Serial << "y: " << y << '\n';
      //Serial << "Bqdd: " << Bqdd << '\n';

      // Calculate required torque of motors
      tau = Bqdd + Cqd + g;

      Serial << "tau: " << tau << '\n';

      // Update the motor input depending on the operating mode
      updateMotorInput(tau, g);

    } else {
      Serial.println("TIMEOUT DETECTED");
    }

    Serial.println(micros() - duration);
    Serial.println();

    vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(100));
  }
}

void TrajectoryPlanner(void* pvParameters) {
  (void)pvParameters;
  TickType_t lastWakeTime = xTaskGetTickCount();

  // Local variables
  double duration = 0;
  double timeOffset = 0;

  // Matrices
  BLA::Matrix<6> R06;

  // If not already updated
  updateMotorState(M);

  // Array to hold the joint space path points converted from the user input using inverse kinematics
  float times[100] = { 0, 5, 10 };
  float positions[100][6] = { 0 };
  float velocities[100][6] = { 0 };

  // Initialize some inputs for tests
  // First point
  positions[1][0] = PI / 4;
  positions[1][1] = PI / 4;
  positions[1][2] = PI / 4;
  positions[1][3] = PI / 4;
  positions[1][4] = PI / 4;
  positions[1][5] = PI / 4;

  // Second point
  positions[2][0] = PI / 2;
  positions[2][1] = PI / 2;
  positions[2][2] = PI / 2;
  positions[2][3] = PI / 2;
  positions[2][4] = PI / 2;
  positions[2][5] = PI / 2;

  // Initialize path points (this should be executed in runtime in reality)
  for (int i = 0; i < 6; i++) {
    // Set initial path point
    Tr[i]->times[0] = 0;
    Tr[i]->positions[0] = M[i]->state.q;  //
    Tr[i]->velocities[0] = 0;             //M[i]->state.qd.  Maybe better to set to zero? In case of a bad reading, the trajectory will be crazy...

    // Set the rest of the path points
    for (int j = 1; j < Tr[i]->numberOfViaPoints; j++) {
      Tr[i]->times[j] = times[j] * 1000.0;
      Tr[i]->positions[j] = positions[j][i];
      Tr[i]->velocities[j] = velocities[j][i];
    }
  }

  while (1) {
    // Trajectory should only be updated if the manipualtor is not already executing a trajectory
    if (!inMotionFlag) {
      if (UserInputListener()) {
        /*
        for (int i = 1; i < TR[1]->numberOfViaPoints) {
          // Convert user input orientation to rotation matrix and to joint space
          R06 = convertEuler2Matrix(alpha, beta, gamma);

          // Convert user input to joint space using inverse kinematics
          Positions
        }
        */





        // Compute cubic polynomial between each via point
        for (int i = 0; i < 6; i++) {
          for (int j = 0; j < Tr[i]->numberOfViaPoints - 1; j++) {
            // Calculate duration of motion
            duration = Tr[i]->times[j + 1] - Tr[i]->times[j];

            // Compute Cubic Coefficients
            Tr[i]->CubicCoefs[j] = getCubicCoef(duration, Tr[i]->positions[j], Tr[i]->positions[j + 1], Tr[i]->velocities[j], Tr[i]->velocities[j + 1]);
          }
        }
        // Capture time of motion start
        timeOffset = millis();

        // Set time offset for Polynomials
        for (int i = 0; i < 6; i++) {
          for (int j = 0; j < Tr[i]->numberOfViaPoints; j++) {
            Tr[i]->timeOffsets[j] = Tr[i]->times[j] + timeOffset;
          }
        }
        inMotionFlag = 1;
        //User input is received and trajectories can be calculated.
      }
    }
    // If the robot is not in motion, poll for user input


    vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(1000));
  }
}

CubicCoef getCubicCoef(double tf, double q0, double qf, double v0, double vf) {
  CubicCoef c;
  double tf_s = tf / 1000.0;  // Convert ms to s
  c.a0 = q0;
  c.a1 = v0;
  c.a2 = (3 / pow(tf_s, 2)) * (qf - q0) + (2 / tf_s) * v0 - (1 / tf_s) * vf;
  c.a3 = -(2 / pow(tf_s, 3)) * (qf - q0) + (1 / pow(tf_s, 2)) * (vf + v0);
  return c;
}

double getDesiredJointPosition(double t, CubicCoef c) {
  return c.a0 + c.a1 * t + c.a2 * t * t + c.a3 * t * t * t;
}

double getDesiredJointVelocity(double t, CubicCoef c) {
  return c.a1 + 2 * c.a2 * t + 3 * c.a3 * t * t;
}

double getDesiredJointAcceleration(double t, CubicCoef c) {
  return 2 * c.a2 + 6 * c.a3 * t;
}
