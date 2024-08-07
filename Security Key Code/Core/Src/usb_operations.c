/*
 * usb_operations.c
 *
 *  Created on: Aug 4, 2024
 *      Author: Ashish Bansal
 */


/*-------------------------------INCLUDES---------------------------------------*/
#include "usb_operations.h"
#include "main.h"
#include <stdio.h>
/*-----------------------------END INCLUDES-------------------------------------*/

/*-------------------------------DEFINES----------------------------------------*/

/*-----------------------------END DEFINES--------------------------------------*/


/*---------------------------Typedefs & Structures------------------------------*/
typedef struct
{
	uint8_t report_id;
	uint8_t paramter;
	uint8_t data[64];
}Report;
/*-------------------------END Typedefs & Structures----------------------------*/

/*-------------------------------Extern Variables--------------------------------------*/
extern UART_HandleTypeDef huart4;
/*-----------------------------END Extern Variables------------------------------------*/

/*-------------------------------Variables--------------------------------------*/
const UART_HandleTypeDef *FingerPrint = &huart4;

USB_OPERATIONS operation = NO_ACTION;

const char *HOST_STRING   = "Hi, this string from host which is signed using Device Public Key";
const char *DEVICE_STRING = "Hi, this one is from the firware side which is signed using HOST Public Key";

static uint8_t HOST_Public_Key[PUBLIC_KEY_SIZE];
static uint8_t DEVICE_Public_Key[PUBLIC_KEY_SIZE];
/*-----------------------------END Variables------------------------------------*/


/*-------------------------------Function Prototypes--------------------------------------*/

// When USB is idle
void no_action();

// To exchange Public Key with HOST
void Exchange_Public_Key();

// Receive signed string and confirm if it is correct string or not
void Receive_String();

// Send the signed string to DEVICE
void Send_String();

// To handle FingerPrint cmds
void HandleFingerprint();

// To continoulsy check if the DEVICE is connected to the host or not
void Send_Status();
/*-----------------------------END Function Prototypes------------------------------------*/

// function handler to directly use the functions according to the operation to be performed
const function_handler Operations[7] = {
	no_action,
	Exchange_Public_Key,
	Receive_String,
	Send_String,
	HandleFingerprint,
	Send_Status
};

/*-------------------------------Function Definitions--------------------------------------*/
/*
 * Don't do any action and wait for change of state of 'operation'
 */
void no_action()
{
	while(operation == NO_ACTION)
	{
		printf("NO Operation = %d\r\n", 10);
//		HAL_Delay(1000);
		// make it sleep somehow to help reduce power
	}
}

/*
 * Receive Public Key from Host and Then send Device Public Key
 */

void Exchange_Public_Key()
{
	printf("In Exchange Public Key\r\n");

	//Generate Private and Public Keys
	//Send Public Key

	//Receive Public Key from HOST
}

void Receive_String()
{
	// Decrypt string
	// compare string
	// if correct string received from HOST continue
	// else Error Led ON & put in no_action loop
}
void Send_String()
{
	// encrypt string
	// Send to host
}
void HandleFingerprint()
{

}

void Send_Status()
{

	send_report(report, len)
}

/*-----------------------------END Function Definitions------------------------------------*/
