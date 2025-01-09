/*
 * usb_operations.c
 *
 *  Created on: Aug 4, 2024
 *      Author: Ashish Bansal
 */


/*-------------------------------INCLUDES---------------------------------------*/
#include <stdio.h>
#include <string.h>
#include "usb_operations.h"
#include "main.h"
//#include "RSA.h"
#include "FingerPrint_Module.h"
#include "LED.h"
/*-----------------------------END INCLUDES-------------------------------------*/

/*-------------------------------DEFINES----------------------------------------*/
#define KEY (10)

/*-----------------------------END DEFINES--------------------------------------*/


/*---------------------------Typedefs & Structures------------------------------*/

/*-------------------------END Typedefs & Structures----------------------------*/


/*-------------------------------Extern Variables--------------------------------------*/
extern UART_HandleTypeDef huart4;
extern uint8_t *report_buffer;
extern int8_t send_report(uint8_t* report, uint16_t len);

/*-----------------------------END Extern Variables------------------------------------*/


/*-------------------------------Variables--------------------------------------*/
const UART_HandleTypeDef *FingerPrint = &huart4;
const char *STRING = "Encode this string";

Report IN_;
USB_OPERATIONS operation = NO_ACTION;

/*-----------------------------END Variables------------------------------------*/


/*-------------------------------Function Prototypes--------------------------------------*/

static inline void Send_to_Host(Report);

/*-----------------------------END Function Prototypes------------------------------------*/

// function handler to directly use the functions according to the operation to be performed
const function_handler Operations[] = {
	no_action,
	Encode_String,
	HandleFingerprint,
	Send_Status
};


/*-------------------------------Function Definitions--------------------------------------*/

/*
 * Send the report to Host device
 */
static inline void Send_to_Host(Report report)
{
	send_report((uint8_t*)&report, sizeof(Report));
}

/*
 * Don't do any action and wait for change of state of 'operation'
 */
void no_action()
{
	printf("In no operation\r\n");
	HAL_Delay(300);
}

void Encode_String()
{
	Report string_report = { .report_id = ENCODE_STRING};
	printf("Handle_Signed_String\r\n");
	for(int i=0; i < 19; ++i)
	{
		string_report.data[i] = STRING[i] + KEY;
	}
	Send_to_Host(string_report);
	operation = NO_ACTION;
}

/*
 * To handle FingerPrint COMMANDs
 */
void HandleFingerprint()
{
	printf("Inside HandleFingerprint %d %x\r\n", IN_.parameter, IN_.data[0]);
	Report Out=  {.report_id = IN_.report_id, .parameter = IN_.parameter, .data = {0}};

	switch(IN_.parameter)
	{
	case F_IDENTITFY:
		Out.data[0] = Identify_Fingerprint();
		break;
	case F_NEWID:
		Out.data[0] = Get_EntryID();
		break;
	case F_ENROLL:
//		HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_14);
		Out.data[0] = Enroll_Fingerprint(IN_.data[0]);
		break;
	case F_ENROLL_C:
		Enroll_Cancel();
		break;
	case F_DELETE:
		Delete_Fingerprint_ID(IN_.data[0]);
		break;
	case F_DEL_ALL:
		Delete_All_Fingerprints();
		break;
	case HOST_TO_DEV:
	case DEV_TO_HOST:
	}

	Send_to_Host(Out);
	printf("%x %x \r\n",Out.parameter, Out.data[0]);
	HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_15);
	operation = NO_ACTION;
}

/*
 * Send status of device to HOST
 */
void Send_Status()
{
	printf("Inside Send_Status\r\n");
	Report report = { .report_id = STATUS_CHECK, .data = "Co"};
	for(uint8_t i = 0; i < 20; ++i)
	{
		Send_to_Host(report);
	}
}

/*-----------------------------END Function Definitions------------------------------------*/
