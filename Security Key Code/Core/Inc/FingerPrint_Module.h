#ifndef FINGERPRINT_MODULE_H
#define FINGERPRINT_MODULE_H

#include "stm32f4xx_hal.h"

// Enumeration for acknowledgment responses
typedef enum {
    F_SUCCESS = 0x00,
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
} ACKNOWLEDGMENT;

// Enumeration for commands
typedef enum {
    OPEN = 0xA0,
    CLOSE = 0xA1,
    LED_CONTROL = 0xB4,
    IS_FINGER_PRESS = 0xB5,
    ENROLL = 0x01,
    DELETE_ID = 0x04,
    DELETE_ALL = 0x05,
    GET_USER_COUNT = 0x09,
    IDENTIFY = 0x0C,
    GET_ENTRY_ID = 0x0D,
    ENROLL_CANCEL = 0x92
} Command;

// Structure for the command packet
typedef struct {
    uint8_t start_byte;
    Command command;
    uint8_t parameter[4];
    uint8_t checksum;
    uint8_t end_byte;
} Packet;

// Function prototypes
uint8_t calculate_checksum(Packet pkt);

void Open_Fingerprint_Module(void);
void Close_Fingerprint_Module(void);
void LED_Control_Fingerprint_Module(uint8_t state);
uint8_t Is_Finger_Pressed(void);
void Enroll_Fingerprint(uint8_t ID);
void Delete_Fingerprint_ID(uint8_t ID);
void Delete_All_Fingerprints(void);
uint8_t Get_User_Count(void);
uint8_t Identify_Fingerprint(void);
uint8_t Get_EntryID(void);
void Enroll_Cancel(void);

#endif // FINGERPRINT_MODULE_H
