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
#include "mbedtls/rsa.h"
#include "mbedtls/ctr_drbg.h"
#include "mbedtls/entropy.h"
/*-----------------------------END INCLUDES-------------------------------------*/

/*-------------------------------DEFINES----------------------------------------*/

/*-----------------------------END DEFINES--------------------------------------*/


/*---------------------------Typedefs & Structures------------------------------*/
typedef struct
{
	USB_OPERATIONS 	report_id;
	uint8_t 		paramter;
	char 			data[SIGNED_STRING_SIZE];
}Report;
/*-------------------------END Typedefs & Structures----------------------------*/

/*-------------------------------Extern Variables--------------------------------------*/
extern UART_HandleTypeDef huart4;
extern uint8_t *report_buffer;
extern int8_t send_report(uint8_t* report, uint16_t len);

/*-----------------------------END Extern Variables------------------------------------*/

/*-------------------------------Variables--------------------------------------*/
const UART_HandleTypeDef *FingerPrint = &huart4;

USB_OPERATIONS operation = NO_ACTION;

const char *HOST_STRING   = "this string from host signed using Device Public Key";
const char *DEVICE_STRING = "this string from Device signed using HOST Public Key";

static char HOST_Public_Key[PUBLIC_KEY_SIZE];
static char DEVICE_Public_Key[PUBLIC_KEY_SIZE];
/*-----------------------------END Variables------------------------------------*/


/*-------------------------------Function Prototypes--------------------------------------*/

static inline void Send_to_Host(Report);

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
	Report report;

	report.report_id = EXCHANGE_PUBLIC_KEY;
	strcpy(report.data, "Device Public Key");
	//Generate Private and Public Keys
#if 0
	int ret;
	const char* pers = "Ashish Bansal";
	mbedtls_rsa_context rsa;
	mbedtls_ctr_drbg_context ctr_drbg;
	mbedtls_entropy_context entropy;

	mbedtls_rsa_init(&rsa, MBEDTLS_RSA_PKCS_V15, 0);

	// Seed the random number generator
	ret = mbedtls_ctr_drbg_seed(&ctr_drbg, mbedtls_entropy_func, &entropy, (const unsigned char *) pers, strlen(pers));
	if (ret != 0) {
		printf("Failed to initialize RNG\n");
		return;
	}

	mbedtls_rsa_gen_key(&rsa, mbedtls_ctr_drbg_random, &ctr_drbg, 512, 65537);

	size_t pub_key_len = sizeof(report.data);
	ret = mbedtls_rsa_export_pubkey(&rsa, report.data, &pub_key_len);
	mbedtls_rsa_export(ctx, N, P, Q, D, E)

	if (ret != 0) {
		printf("Failed to export public key: -0x%x\n", -ret);
		return;
	}
#endif
	//Send Public Key

	Send_to_Host(report);
	operation = NO_ACTION;
	strncpy(DEVICE_Public_Key, report.data, PUBLIC_KEY_SIZE);

	//Receive Public Key from HOST
	while(operation == NO_ACTION);

	//save Host Public Key
	strncpy(HOST_Public_Key, (char*)report_buffer, PUBLIC_KEY_SIZE);
}

/*
 * Receive signed string from HOST
 */
void Receive_String()
{
	// Decrypt string
	// compare string
	// if correct string received from HOST continue
	// else Error Led ON & put in no_action loop
}

/*
 * Send signed string to HOST
 */
void Send_String()
{
	Report string_report;
	string_report.report_id = SIGNED_STRING;
	strncpy((char*)string_report.data, DEVICE_STRING, strlen(DEVICE_STRING));
	// encrypt string

	// Send to host
	Send_to_Host(string_report);
}

/*
 * To handle FingerPrint COMMANDs
 */
void HandleFingerprint()
{

}

/*
 * Send status of device to HOST
 */
void Send_Status()
{
	Report report = {STATUS_CHECK, 0, {0}};
	Send_to_Host(report);
}

/*-----------------------------END Function Definitions------------------------------------*/
