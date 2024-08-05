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
    NO_ACTION,
    RECEIVE_KEY,
    SEND_KEY,
    RECEIVE_STRING,
    SEND_STRING,
    SEND_FINGERPRINT,
    STATUS_CHECK
} USB_OPERATIONS;


typedef void (*function_handler)(void);

#endif /* INC_USB_OPERATIONS_H_ */
