/**
 * Created 29/02/2012
 * Pete Hemery
 */

#define BUFFER_SIZE 10
typedef unsigned char BYTE;

enum {
  SERVO,
  WORKSPACE
};
#define KEYPAD_MODE SERVO

enum {
  NONE,
  RESET,
  ITEM_DELETED
};

/* Macros */
#define round(x) ((x)>=0?(long)((x)+5):(long)((x)-5))
#define deg_to_arm(x) (round(((x) *((2000*100)/180) + (500*100)) / 10) / 10)

/* Structures */
struct servo_set_t {
  unsigned int s0: 1;
  unsigned int s1: 1;
  unsigned int s2: 1;
  unsigned int s3: 1;
  unsigned int s4: 1;
  unsigned int s5: 1;
};

struct workspace_set_t {
  unsigned int X: 1;
  unsigned int Y: 1;
  unsigned int Z: 1;
  unsigned int wristR1: 1;
  unsigned int wristR2: 1;
  unsigned int hand: 1;
};

union servo_or_ws_t {
  struct workspace_set_t ws;
  struct servo_set_t servo;
};

union servo_set_u {
  struct servo_set_t flag_bits;
  unsigned char servo_flags;
};

struct flagtype_t {
  BYTE keypad_mode;  /* Servo or Workspace */
/*  union servo_or_ws_t servo_or_ws;*/
/*  struct servo_set_t servo_set;*/
  union servo_set_u servo_set;
  unsigned short time;
  unsigned short wait;
};

struct servo_t {
  unsigned short position;
  unsigned short speed;
};

struct waypoint_t {
  unsigned short waypoint_number;
  struct flagtype_t flag;
  struct servo_t servos[6];
  struct waypoint_t *next;
  struct waypoint_t *prev;
};

