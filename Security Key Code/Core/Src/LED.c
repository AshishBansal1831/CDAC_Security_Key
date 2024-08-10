/*
 * LED.c
 *
 *  Created on: Aug 5, 2024
 *      Author: Ashish Bansal
 */
#include "main.h"
#include "usb_operations.h" // included for function_handler

#define GREEN_LED 		GPIO_PIN_12
#define RED_LED 		GPIO_PIN_14
#define BLUE_LED 		GPIO_PIN_14

typedef struct
{
	function_handler ON;
	function_handler OFF;
}LEDs;

static inline void GreenON()
{
	HAL_GPIO_WritePin(GPIOD, GREEN_LED, SET);
}

static inline void GreenOFF()
{
	HAL_GPIO_WritePin(GPIOD, GREEN_LED, RESET);
}

static inline void RedON()
{
	HAL_GPIO_WritePin(GPIOD, RED_LED, SET);
}

static inline void RedOFF()
{
	HAL_GPIO_WritePin(GPIOD, RED_LED, RESET);
}

static inline void BlueON()
{
	HAL_GPIO_WritePin(GPIOD, BLUE_LED, SET);
}

static inline void BlueOFF()
{
	HAL_GPIO_WritePin(GPIOD, BLUE_LED, RESET);
}

static LEDs Error 	= {RedON, 	RedOFF};
static LEDs ALL_OK 	= {BlueON, 	BlueOFF};
static LEDs OnGoing = {GreenON, GreenOFF};

void Error_Occured();
void Hard_Fault_Occured();
void Everything_OK();
void ON_Going();

void Error_Occured()
{
	while(1)
	{
		ALL_OK.OFF();
		OnGoing.OFF();
		Error.ON();
	}
}

void Hard_Fault_Occured()
{
	ALL_OK.OFF();
	while(1)
	{
		Error.ON();
		HAL_Delay(100);
		Error.OFF();
		HAL_Delay(100);
	}
}
void Everything_OK()
{
	ALL_OK.ON();
}

void ON_Going()
{
	static uint8_t state = 0;
	if(state == 1)
	{
		OnGoing.ON();
		HAL_Delay(100);
		OnGoing.OFF();
		HAL_Delay(100);
	}
}


