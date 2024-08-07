/*
 * usb_operations.h
 *
 *  Created on: Aug 2, 2024
 *      Author: Ashish Bansal
 */

#ifndef INC_USB_OPERATIONS_H_
#define INC_USB_OPERATIONS_H_

#define REPORT_BUF_SIZE		64	// in bytes

#define PUBLIC_KEY_SIZE 	64 	// in bytes
#define SIGNED_STRING_SIZE 	64 	// in bytes

#define FP_CMD_SIZE			1  	// in bytes
#define STATUS_CMD_SIZE		1 	// in bytes

#define CMD_SIZE			1	// in bytes

typedef enum
{
    NO_ACTION,				// When No actions to be performed
    EXCHANGE_PUBLIC_KEY,	// To exchange the public keys
    SIGNED_STRING_D2H,		// TO send Signed String from Device to HOST machine
	SIGNED_STRING_H2D,		// To get Signed String from HOSt
    CMD_FINGERPRINT,		// TO Handle FingerPrint Cmds, next byte contains the cmd to be executed
    STATUS_CHECK			// To check if the device is connected or not
} USB_OPERATIONS;


typedef void (*function_handler)(void);

#endif /* INC_USB_OPERATIONS_H_ */
