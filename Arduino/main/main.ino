// Includes
#include <Dynamixel2Arduino.h>
#include <math.h>
#include <BasicLinearAlgebra.h>
#include "Dynamics.h"
#include "Structures.h"
#include "Kinematics.h"

// Setup communication with motors
#define DXL_SERIAL Serial1
#define DEBUG_SERIAL Serial
const int DXL_DIR_PIN = 2;  // DYNAMIXEL Shield DIR PIN
const float DXL_PROTOCOL_VERSION = 2.0;
Dynamixel2Arduino dxl(DXL_SERIAL, DXL_DIR_PIN);

#define RX1 21  // UART receive pin
#define TX1 22  // UART transmit pin

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
bool firstStartup = 1;
extern bool validInput;
uint32_t motorTimeout = 3;
bool timeoutFlag1 = false;
double MX_28_Constants[4] = { 211.7, 427.4, 642.0, 115.3 };
double MX_64_Constants[4] = { 80.9, 152.7, 224.5, 105.3 };
double MX_106_Constants[4] = { 40.4, 83.9, 127.5, 160.6 };
double* motorConstants[] = { MX_28_Constants, MX_64_Constants, MX_106_Constants };
float userPositions[100][6] = { 0 };
float userTimes[100] = { 0 };

// Motor constant found by testing
float MX_106_motorConstant = 133.33;
float MX_64_motorConstant = 172.41;

/*
  Models numbers:
  MX28: 30
  MX64: 311
  MX106: 321
*/

// Initialize motors (ID;TYPE;MODEL;OPERATINGMODE;OFFSET)
Motor M1(1, MX_64, 311, OP_PWM, -2 * PI, 2 * PI, -1030.0);
Motor M2(2, MX_106, 321, OP_PWM, -0.434117578, 3.548105859, -1029.0);
Motor M3(3, MX_106, 321, OP_PWM, -0.398835938, 3.592591406, -942.0);
Motor M4(4, MX_28, 30, OP_PWM, -2 * PI, 2 * PI, -2018);
Motor M5(5, MX_64, 311, OP_PWM, -1.951228125, 2.029461328, -2020.0);
Motor M6(6, MX_28, 30, OP_PWM, -2 * PI, 2 * PI, -3458.0);

Motor* M[6] = { &M1, &M2, &M3, &M4, &M5, &M6 };

// Initialize Trajectory planner with number of via points
Trajectory Tr1(3);
Trajectory Tr2(3);
Trajectory Tr3(3);
Trajectory Tr4(3);
Trajectory Tr5(3);
Trajectory Tr6(3);

Trajectory* Tr[6] = { &Tr1, &Tr2, &Tr3, &Tr4, &Tr5, &Tr6 };

// Bulk read setup
const float DYNAMIXEL_PROTOCOL_VERSION = 2.0;
const uint8_t BROADCAST_ID = 254;
const uint8_t DXL_ID_CNT = 6;
//const uint8_t DXL_ID_LIST[DXL_ID_CNT] = { 1, 2, 3, 4, 5, 6 };
const uint16_t user_pkt_buf_cap = 128;
uint8_t user_pkt_buf[user_pkt_buf_cap];

const uint16_t SR_START_ADDR = 128;  //Present position
const uint16_t SR_ADDR_LEN = 4 + 4;
const uint16_t SW_START_ADDR = 100;  //Goal pwm
const uint16_t SW_ADDR_LEN = 2;

typedef struct sr_data {
  int32_t present_velocity;
  int32_t present_position;
} __attribute__((packed)) sr_data_t;

typedef struct sw_pwm {
  int32_t goal_pwm;
} __attribute__((packed)) sw_pwm_t;

typedef struct sw_current {
  int32_t goal_current;
} __attribute__((packed)) sw_current_t;

sr_data_t sr_data[DXL_ID_CNT];
DYNAMIXEL::InfoSyncReadInst_t sr_infos;
DYNAMIXEL::XELInfoSyncRead_t info_xels_sr[DXL_ID_CNT];

sw_pwm_t sw_pwm[6];
DYNAMIXEL::InfoSyncWriteInst_t sw_infos_pwm;
DYNAMIXEL::XELInfoSyncWrite_t info_xels_s_pwm[6];

sw_current_t sw_current[4];
DYNAMIXEL::InfoSyncWriteInst_t sw_infos_current;
DYNAMIXEL::XELInfoSyncWrite_t info_xels_s_current[4];


















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

  // Bulk read setup
  sr_infos.packet.buf_capacity = user_pkt_buf_cap;
  sr_infos.packet.p_buf = user_pkt_buf;
  sr_infos.packet.is_completed = false;
  sr_infos.addr = SR_START_ADDR;
  sr_infos.addr_length = SR_ADDR_LEN;
  sr_infos.p_xels = info_xels_sr;
  sr_infos.xel_count = 0;

  // Bulk write setup
  // Fill the members of structure to syncWrite using internal packet buffer
  sw_infos_pwm.packet.p_buf = nullptr;
  sw_infos_pwm.packet.is_completed = false;
  sw_infos_pwm.addr = 100;
  sw_infos_pwm.addr_length = 2;
  sw_infos_pwm.p_xels = info_xels_s_pwm;
  sw_infos_pwm.xel_count = 0;

  //2
  sw_infos_current.packet.p_buf = nullptr;
  sw_infos_current.packet.is_completed = false;
  sw_infos_current.addr = 102;
  sw_infos_current.addr_length = 2;
  sw_infos_current.p_xels = info_xels_s_current;
  sw_infos_current.xel_count = 0;

  // Motor Setup
  for (int i = 0; i < DXL_ID_CNT; i++) {
    Serial.print("Ping: ");
    Serial.println(dxl.ping(M[i]->ID));

    dxl.torqueOff(M[i]->ID);
    dxl.writeControlTableItem((uint8_t)RETURN_DELAY_TIME, (uint8_t)M[i]->ID, (int32_t)250, motorTimeout);
    //dxl.setBaudrate(M[i]->ID, 4500000);
    dxl.setOperatingMode(M[i]->ID, M[i]->mode);

    //Serial.println(dxl.readControlTableItem(BAUD_RATE, M[i]->ID));
    if (M[i]->mode == OP_CURRENT) {
      dxl.writeControlTableItem((uint8_t)GOAL_PWM, (uint8_t)M[i]->ID, (int32_t)800, motorTimeout);
    }
    if (M[i]->mode == OP_PWM) {
      dxl.writeControlTableItem((uint8_t)GOAL_CURRENT, (uint8_t)M[i]->ID, (int32_t)2047, motorTimeout);
    }

    // Print info
    Serial.print("Motor");
    Serial.println(M[i]->ID);
    Serial.println(dxl.readControlTableItem((uint8_t)OPERATING_MODE, (uint8_t)M[i]->ID, motorTimeout));
    Serial.println(dxl.readControlTableItem((uint8_t)RETURN_DELAY_TIME, (uint8_t)M[i]->ID, motorTimeout));
    Serial.println(dxl.readControlTableItem((uint8_t)PRESENT_POSITION, (uint8_t)M[i]->ID, motorTimeout));

    dxl.torqueOn(M[i]->ID);

    // Sync read setup
    info_xels_sr[i].id = M[i]->ID;
    info_xels_sr[i].p_recv_buf = (uint8_t*)&sr_data[i];
    sr_infos.xel_count++;
  }
  for (int i = 0; i < 6; i++) {
    // Sync write setup
    sw_pwm[i].goal_pwm = 0;
    info_xels_s_pwm[i].id = M[i]->ID;
    info_xels_s_pwm[i].p_data = (uint8_t*)&sw_pwm[i].goal_pwm;
    sw_infos_pwm.xel_count++;
    info_xels_s_pwm[i].id = M[i]->ID;
  }

  sr_infos.is_info_changed = true;
  sw_infos_pwm.is_info_changed = true;

  // Semaphore Creation
  motorComms = xSemaphoreCreateMutex();

  // Task Creation
  xTaskCreate(ControlTask, "Control Task", 30000, NULL, 2, NULL);
  xTaskCreate(TrajectoryPlanner, "Trajectory Planner", 30000, NULL, 1, NULL);
}


















/* ----- GENERAL FUNCTIONS -----*/
// Updates the current state of the motor (reads position and velocity of all motors)
void ReadMotorState(Motor* M[6]) {
  uint8_t recv_cnt;
  float sensitivity;
  double x = 0;

  // Read from motors using syncread
  xSemaphoreTake(motorComms, 1000);
  recv_cnt = dxl.syncRead(&sr_infos);
  xSemaphoreGive(motorComms);

  // Check if we received something from all motors
  if (recv_cnt > 0) {
  } else {
    Serial.print("[fastSyncRead] Fail, Lib error code: ");
    Serial.println(dxl.getLastLibErrCode());
    timeoutFlag1 = true;
    return;
  }
  // Special sensitivity on first startup to avoid invalid readings.
  if (firstStartup) {
    sensitivity = 10000;
    firstStartup = 0;
  } else {
    sensitivity = 300;
  }

  // Check position
  for (int i = 0; i < DXL_ID_CNT; i++) {
    x = ((sr_data[i].present_position + M[i]->offset) / 4096.0) * 2 * PI;
    if (abs(x - M[i]->state.q) < sensitivity) {
      M[i]->state.q = x;
    } else {
      Serial.print("Position change unaccpeted for motor: ");
      Serial.print(M[i]->ID);
      Serial.print(" | Previous: ");
      Serial.print(M[i]->state.q);
      Serial.print(" | Measured: ");
      Serial.print(x);
      Serial.print(" | Diff:  ");
      Serial.println(abs(x - M[i]->state.q));
    }
    // Check velocity validity
    x = ((sr_data[i].present_velocity * 0.229) / 60.0) * 2.0 * PI;
    if (abs(x - M[i]->state.qd) < sensitivity / 5) {
      M[i]->state.qd = x;
    } else {
      Serial.print("Velocity change unaccpeted for motor: ");
      Serial.print(M[i]->ID);
      Serial.print(" | Previous: ");
      Serial.print(M[i]->state.qd);
      Serial.print(" | Measured: ");
      Serial.print(x);
      Serial.print(" | Diff:  ");
      Serial.println(abs(x - M[i]->state.qd));
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
__attribute__((always_inline)) void get_Cqd(float Arr[6], Pos* p, Vel* v, Optimizer* o) {
  Arr[0] = get_Cqd1(p, v, o);
  Arr[1] = get_Cqd2(p, v, o);
  Arr[2] = get_Cqd3(p, v, o);
  Arr[3] = get_Cqd4(p, v, o);
  Arr[4] = get_Cqd5(p, v, o);
  Arr[5] = get_Cqd6(p, v, o);
}
__attribute__((always_inline)) void get_g(float Arr[6], Pos* p, Optimizer* o) {
  Arr[0] = get_g1(p, o);
  Arr[1] = get_g2(p, o);
  Arr[2] = get_g3(p, o);
  Arr[3] = get_g4(p, o);
  Arr[4] = get_g5(p, o);
  Arr[5] = get_g6(p, o);
}
__attribute__((always_inline)) void get_Bqdd(float Arr[6], Pos* p, Acc* a, Optimizer* o) {
  Arr[0] = get_Bqdd1(p, a, o);
  Arr[1] = get_Bqdd2(p, a, o);
  Arr[2] = get_Bqdd3(p, a, o);
  Arr[3] = get_Bqdd4(p, a, o);
  Arr[4] = get_Bqdd5(p, a, o);
  Arr[5] = get_Bqdd6(p, a, o);
}

void updateMotorInput(BLA::Matrix<6> tau, BLA::Matrix<6> g) {
  double C1, C2 = 0;
  int motorType = 0;
  double input_test = 0;
  float nullSpace = 0.001;
  float currentLimit = 0;
  bool sucFlag = false;

  for (int i = 0; i < DXL_ID_CNT; i++) {
    // Chech the operating mode of the motor
    if (M[i]->mode == OP_CURRENT) {
      if (M[i]->type == MX_106) {
        currentLimit = 2047;
        if (tau(i) > nullSpace || tau(i) < -nullSpace) {
          input_test = tau(i) * 133.33;
        } else {
          input_test = 0;
        }
      } else if (M[i]->type == MX_64) {
        currentLimit = 1941;
        if (tau(i) > nullSpace || tau(i) < -nullSpace) {
          input_test = tau(i) * 172.41;
        } else {
          input_test = 0;
        }
      } else if (M[i]->type == MX_28) {
        Serial.println("INVALID MOTOR TYPE FOR CURRENT CONTROL");
      }

      // Check if the current value exceeds the maximum or minimum value
      if (input_test > currentLimit) {
        input_test = currentLimit;
      }
      if (input_test < -currentLimit) {
        input_test = -currentLimit;
      }

      // Update input in motor struct
      M[i]->input = input_test;

    } else if (M[i]->mode == OP_PWM) {
      /*
          Choose C1 based on assited or opposed by gravity
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

      // Update input in motor struct
      M[i]->input = input_test;
    }
  }
  // Insert data into buffer
  sw_pwm[0].goal_pwm = M[0]->input;
  sw_pwm[1].goal_pwm = M[1]->input;
  sw_pwm[2].goal_pwm = M[2]->input;
  sw_pwm[3].goal_pwm = M[3]->input;
  sw_pwm[4].goal_pwm = M[4]->input;
  sw_pwm[5].goal_pwm = M[5]->input;
  sw_infos_pwm.is_info_changed = true;

  // Write the data to the motors using syncWrite
  xSemaphoreTake(motorComms, 1000);
  timeoutFlag1 = !dxl.syncWrite(&sw_infos_pwm);
  xSemaphoreGive(motorComms);
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
        innerIndex = 0;
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
    }

    // Insert number of via points in trajectory for every motor
    for (int i = 0; i < 6; i++) {
      Tr[i]->numberOfViaPoints = arrayIndex - 1;
    }

    return 1;
  }
  return 0;
}



// Get coefficients for cubic polynomial based on time duration and start, end positions and velocities
CubicCoef getCubicCoef(double tf, double q0, double qf, double v0, double vf) {
  CubicCoef c;
  double tf_s = tf / 1000.0;  // Convert ms to s
  c.a0 = q0;
  c.a1 = v0;
  c.a2 = (3 / pow(tf_s, 2)) * (qf - q0) + (2 / tf_s) * v0 - (1 / tf_s) * vf;
  c.a3 = -(2 / pow(tf_s, 3)) * (qf - q0) + (1 / pow(tf_s, 2)) * (vf + v0);
  return c;
}

// Calculate the current desired position based on cubic coefficients and current time
double getDesiredJointPosition(double t, CubicCoef c) {
  return c.a0 + c.a1 * t + c.a2 * t * t + c.a3 * t * t * t;
}

// Calculate the current desired velocity based on cubic coefficients and current time
double getDesiredJointVelocity(double t, CubicCoef c) {
  return c.a1 + 2 * c.a2 * t + 3 * c.a3 * t * t;
}

// Calculate the current desired acceleration based on cubic coefficients and current time
double getDesiredJointAcceleration(double t, CubicCoef c) {
  return 2 * c.a2 + 6 * c.a3 * t;
}


/* ----- UNUSED LOOP ----- */
void loop() {
  // Empty loop since the scheduler will handle the task execution
}


/* ----- TASKS ----- */
void ControlTask(void* pvParameters) {
  (void)pvParameters;
  TickType_t lastWakeTime = xTaskGetTickCount();

  // Controller parameters: Brugt til simple movement test (PWM)
  //double w_n[6] = { 15, 12, 20, 25, 23, 40 };     // natural frequency of system
  //double z_n[6] = { 0.4, 0.25, 0.3, 1, 0.3, 1 };  // damping ratio of system

  // Controller parameters: Brugt til alle PWM tests
  double w_n[6] = { 12, 15, 15, 25, 15, 40 };    // natural frequency of system
  double z_n[6] = { 0.4, 0.3, 0.3, 1, 0.3, 1 };  // damping ratio of system

  // General Variables
  double timeCapture = 0;
  double inputTime = 0;
  double duration = 0;
  char buffer[1000];

  // Define some structs used for computational optimization
  Pos q_op;
  Vel qd_op;
  Acc y_op;
  Optimizer opt;

  // Arrays for joint variables for computational efficiency
  float CqdArr[6] = { 0, 0, 0, 0, 0, 0 };
  float gArr[6] = { 0, 0, 0, 0, 0, 0 };
  float BqddArr[6] = { 0, 0, 0, 0, 0, 0 };

  // Define Vectors
  BLA::Matrix<6> q = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> qd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> Cqd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> g = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> Bqdd = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> y = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> tau = { 0, 0, 0, 0, 0, 0 };

  // To check values
  BLA::Matrix<6> y1 = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> y2 = { 0, 0, 0, 0, 0, 0 };
  BLA::Matrix<6> y3 = { 0, 0, 0, 0, 0, 0 };

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

  // Pose displayed to user
  BLA::Matrix<3> pos;
  BLA::Matrix<3, 3> ori;
  BLA::Matrix<3> oriEuler;
  pos.Fill(0);
  ori.Fill(0);
  oriEuler.Fill(0);

  // UTF-8 encoding for Greek letters
  const char* alpha = "\xCE\xB1";
  const char* beta = "\xCE\xB2";
  const char* gamma = "\xCE\xB3";

  while (1) {
    timeoutFlag1 = false;
    duration = micros();
    // Read current position and velocity of motors
    ReadMotorState(M);

    // Insert motor state in vector
    q = getCurrentPositionVector(M);
    qd = getCurrentVelocityVector(M);

    if (inMotionFlag && timeoutFlag1 == false) {

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

      // Capture current time
      timeCapture = millis();

      // Calculate desired joint variables
      for (int i = 1; i <= Tr1.numberOfViaPoints; i++) {
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
        } else if (millis() > (Tr1.timeOffsets[Tr1.numberOfViaPoints] + 30000)) {
          inMotionFlag = 0;
        }
      }

      // Calculate control signal error
      q_e = q_d - q;
      qd_e = qd_d - qd;

      // Caluclate input to B(q)y block
      y = Kp * q_e + Kd * qd_e + qdd_d;
      y_op = { y(0), y(1), y(2), y(3), y(4), y(5) };

      // Calculate output of B(q)y block and store in vector
      get_Bqdd(BqddArr, &q_op, &y_op, &opt);
      for (int i = 0; i < 6; i++) {
        Bqdd(i) = BqddArr[i];
      }

      // Calculate required torque of motors
      tau = Bqdd + Cqd + g;

      // Update the motor input depending on the operating mode
      updateMotorInput(tau, g);
  /*
      snprintf(buffer, sizeof(buffer), "%lu,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f",
               millis(),
               q_d(0),
               q_d(1),
               q_d(2),
               q_d(3),
               q_d(4),
               q_d(5),
               M1.state.q,
               M2.state.q,
               M3.state.q,
               M4.state.q,
               M5.state.q,
               M6.state.q,
               qd_d(0),
               qd_d(1),
               qd_d(2),
               qd_d(3),
               qd_d(4),
               qd_d(5),
               M1.state.qd,
               M2.state.qd,
               M3.state.qd,
               M4.state.qd,
               M5.state.qd,
               M6.state.qd,
               tau(0),
               tau(1),
               tau(2),
               tau(3),
               tau(4),
               tau(5),
               M1.input,
               M2.input,
               M3.input,
               M4.input,
               M5.input,
               M6.input);
      Serial.println(buffer);
      */
    }
    
    // Caluclate EE pose in operational space
    pos = getEEPosition(q);
    ori = getEEOrientation(q);
    oriEuler = convertMatrix2Euler(ori);

    // Print the pose to the user
    snprintf(buffer, sizeof(buffer), "Position (XYZ) | Orientation (%s%s%s): %.2f,%.2f,%.2f | %.2f,%.2f,%.2f",
             alpha,
             beta,
             gamma,
             pos(0),
             pos(1),
             pos(2),
             oriEuler(0),
             oriEuler(1),
             oriEuler(2));
  
    Serial.println(buffer);

    //Serial.println(micros() - duration);
    // Task period
    vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(15));
  }
}

void TrajectoryPlanner(void* pvParameters) {
  (void)pvParameters;
  TickType_t lastWakeTime = xTaskGetTickCount();

  // Local variables
  double duration = 0;
  double timeOffset = 0;

  // Matrices
  BLA::Matrix<3, 3> R06;
  BLA::Matrix<6> q;

  // If not already updated
  ReadMotorState(M);

  // Array to hold the joint space path points converted from the user input using inverse kinematics
  float times[100] = { 0, 10, 20, 200 };
  float positions[100][6] = { 0 };
  float velocities[100][6] = { 0 };

  while (1) {
    // Trajectory should only be updated if the manipualtor is not already executing a trajectory
    if (!inMotionFlag) {
      if (UserInputListener()) {  // format "time1 time2 , p11 p12 p13 o11 o12 o13 p21 p22 p23 o21 o22 o23"

        for (int i = 1; i <= Tr[1]->numberOfViaPoints; i++) {
          // Convert user input orientation to rotation matrix and to joint space
          R06 = convertEuler2Matrix(userPositions[i][3], userPositions[i][4], userPositions[i][5]);

          // Convert user input to joint space using inverse kinematics
          int choice1 = 1;
          int choice2 = 1;
          for (int j = 0; j < 6; j++) {
            validInput = true;
            q = InverseKinematics(userPositions[i][0], userPositions[i][1], userPositions[i][2], R06, choice1, choice2);
            for (int k = 0; k < 6; k++) {
              if (q(k) <= -3.14 && q(k) >= -3.15) {
                q(k) = PI;
              }
            }

            // Check validity of solution
            if (q(j) > M[j]->higherLimit || q(j) < M[j]->lowerLimit || isnan(q(j))) {
              if (choice1 < 4) {
                j = -1;
                choice1++;
                continue;
              } else {
                validInput = false;
                Serial.println("No valid solution was found for the position within the manipulator limits!");
                break;
              }
              if (choice2 < 2) {
                j = -1;
                choice1 = 1;
                choice2++;
                continue;
              } else {
                validInput = false;
                Serial.println("No valid solution was found for the orientation within the manipulator limits!");
                break;
              }
            }
          }
          if (validInput) {
            // If a valid solution was found, save the via points in a local array
            for (int j = 0; j < 6; j++) {
              positions[i][j] = q(j);
            }

            // save user input times in local array
            times[i] = userTimes[i];
          } else {
            Serial.print("No solution was found for via point ");
            Serial.println(i);
            break;
          }
        }

        if (validInput == true) {
          // Update motor state
          ReadMotorState(M);

          // Create trajectories for each joint
          for (int i = 0; i < 6; i++) {
            // Set initial path point
            Tr[i]->times[0] = 0;
            Tr[i]->positions[0] = M[i]->state.q;
            Tr[i]->velocities[0] = 0;

            // Set the rest of the path points
            for (int j = 1; j <= Tr[i]->numberOfViaPoints; j++) {
              Tr[i]->times[j] = times[j] * 1000.0;
              Tr[i]->positions[j] = positions[j][i];
              Tr[i]->velocities[j] = velocities[j][i];
            }
          }

          // Compute cubic polynomial between each via point
          for (int i = 0; i < 6; i++) {
            for (int j = 0; j < Tr[i]->numberOfViaPoints; j++) {
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
            for (int j = 0; j <= Tr[i]->numberOfViaPoints; j++) {
              Tr[i]->timeOffsets[j] = Tr[i]->times[j] + timeOffset;
            }
          }
          if (1) {
            inMotionFlag = 1;
          }
        }
      }
    }

    // Task period
    vTaskDelayUntil(&lastWakeTime, pdMS_TO_TICKS(1000));
  }
}
