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

/*-------------------------------Extern Variables--------------------------------------*/
extern UART_HandleTypeDef huart4;
/*-----------------------------END Extern Variables------------------------------------*/

/*-------------------------------Variables--------------------------------------*/
const UART_HandleTypeDef *FingerPrint = &huart4;

USB_OPERATIONS operation = NO_ACTION;
/*-----------------------------END Variables------------------------------------*/


/*-------------------------------Function Prototypes--------------------------------------*/
void no_action();
void Receive_Key();
void Send_Key();
void Receive_String();
void Send_String();
void send_fingerprint();
void Send_Status();
/*-----------------------------END Function Prototypes------------------------------------*/

const function_handler Operations[7] = {
	no_action,
	Receive_Key,
	Send_Key,
	Receive_String,
	Send_String,
	send_fingerprint,
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
		HAL_Delay(1000);
	}
}

/*
 * Receive Public Key from Host and process it
 */

void Receive_Key()
{
	printf("In Receive Key\r\n");
}

/*
 * Send Public Key to Host
 */

void Send_Key()
{

}
void Receive_String()
{

}
void Send_String()
{

}
void send_fingerprint()
{
//	uint8_t fingeprint_id = GetFingerPrintID();


}
void Send_Status()
{

}

/*-----------------------------END Function Definitions------------------------------------*/
