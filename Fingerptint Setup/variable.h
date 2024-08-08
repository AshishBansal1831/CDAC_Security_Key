#ifndef FINGERPRINT_MODULE_H
#define FINGERPRINT_MODULE_H

#include "stm32f4xx_hal.h"

// Enumeration for acknowledgment responses
typedef enum {
    SUCCESS = 0x00,
    FAIL = 0x01,
    FULL = 0x04,
    NOUSER = 0x05,
    USER_EXIST = 0x07,
    TIMEOUT = 0x08,
    WRONG_FORMAT = 0x09,
    BREAK = 0x18,
    INVALID_PARAMETER = 0xB0,
    FINGER_IS_NOT_PRESSED = 0xB1,
    COMMAND_NO_SUPPORT = 0xB4,
    ENROLL_OVEREXPOSURE = 0xB5,
    ENROLL_DUPLICATE = 0xB8,
    FINGER_PRESS_NOT_FULL = 0xB9,
    ENROLL_POOR_QUALITY = 0xBA
} ack;

// Enumeration for commands
typedef enum {
    CMD_OPEN = 0xA0,
    CMD_CLOSE = 0xA1,
    CMD_LED_CONTROL = 0xB4,
    CMD_IS_PRESS_FINGER = 0xB5,
    CMD_ENROLL = 0x01,
    CMD_DELETE_ID = 0x04,
    CMD_DELETE_ALL = 0x05,
    CMD_GET_USER_COUNT = 0x09,
    CMD_IDENTIFY = 0x0C,
    CMD_GET_ENTRY_ID = 0x0D,
    CMD_ENROLL_CANCEL = 0x92
} cmd;

// Structure for the command packet
typedef struct {
    uint8_t start_byte;
    cmd command;
    uint8_t parameter[4];
    uint8_t checksum;
    uint8_t end_byte;
} packet;

// Function prototypes
void send_command(UART_HandleTypeDef *huart, packet *pkt);
uint8_t calculate_checksum(packet *pkt);

void Open_Fingerprint_Module(void);
void Close_Fingerprint_Module(void);
void LED_Control_Fingerprint_Module(uint8_t state);
uint8_t Is_Finger_Pressed(void);
void Enroll_Fingerprint(uint8_t ID);
void Delete_Fingerprint_ID(uint8_t ID);
void Delete_All_Fingerprints(void);
uint8_t Get_User_Count(void);
uint8_t Identify_Fingerprint(void);
uint8_t Get_Entry_ID(void);
void Enroll_Cancel(void);

#endif // FINGERPRINT_MODULE_H
