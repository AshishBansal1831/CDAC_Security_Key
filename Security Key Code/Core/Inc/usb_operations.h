/*
 * usb_operations.h
 *
 *  Created on: Aug 2, 2024
 *      Author: Ashish Bansal
 */

#ifndef INC_USB_OPERATIONS_H_
#define INC_USB_OPERATIONS_H_


#include "stdint.h"


#define REPORT_BUF_SIZE		64	// in bytes

#define PUBLIC_KEY_SIZE 	62 	// in bytes
#define SIGNED_STRING_SIZE 	62 	// in bytes

#define FP_CMD_SIZE			62	// in bytes
#define STATUS_CMD_SIZE		62 	// in bytes
#define CMD_SIZE			62	// in bytes

typedef enum
{
    NO_ACTION,				// When No actions to be performed
    ENCODE_STRING,			// TO send and receive Signed String from/to HOST machine
    CMD_FINGERPRINT,		// TO Handle FingerPrint Cmds, next byte contains the cmd to be executed
    STATUS_CHECK			// To check if the device is connected or not
} USB_OPERATIONS;

typedef enum
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

typedef struct
{
	USB_OPERATIONS 	report_id;
	PARAMETERS 		parameter;
	char 			data[62];
}Report;

typedef void (*function_handler)(void);



// When USB is idle
void no_action();

/*
 * Encode String and send to host
 */
void Encode_String();

// Send the signed string to DEVICE
void Send_String();

// To handle FingerPrint cmds
void HandleFingerprint();

// To continoulsy check if the DEVICE is connected to the host or not
void Send_Status();

#endif /* INC_USB_OPERATIONS_H_ */
