#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <libusb-1.0/libusb.h>
#include <unistd.h> // For sleep function

// #define DEBUG

#define VENDOR_ID       0x0869  // Replace with your device's Vendor ID
#define PRODUCT_ID      0x5750  // Replace with your device's Product ID
#define INTERFACE_NUM   0       // Replace with your interface number
#define ENDPOINT_IN     0x81    // Replace with your IN endpoint address
#define OUT_ENDPOINT    0x01    // Replace with your IN endpoint address

typedef enum __attribute__((packed))
{
    NO_ACTION,
    DECODE_STRING,
    HANDLE_FINGERPRINT,
    STATUS_CHECK
}OPERATIONS;

typedef enum __attribute__((packed))
{
	DEV_TO_HOST,
	HOST_TO_DEV,
	F_IDENTITFY,
    F_NEWID,
	F_ENROLL,
	F_ENROLL_C,
	F_DELETE,
	F_DEL_ALL
}PARAMETERS;

typedef struct __attribute__((packed))
{
    OPERATIONS  operation;
    PARAMETERS  parameters;
    uint8_t     data[62];
}Report;

void login();
int  confirmUSB();
int  DeinitUSB();

uint8_t getFingerPrintID();
uint8_t enrollNewUser(uint8_t);
uint8_t getNewFingerprintID();

