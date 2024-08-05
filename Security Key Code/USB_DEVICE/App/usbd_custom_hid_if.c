/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : usbd_custom_hid_if.c
  * @version        : v1.0_Cube
  * @brief          : USB Device Custom HID interface file.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "usbd_custom_hid_if.h"

/* USER CODE BEGIN INCLUDE */
#include "usb_operations.h"
/* USER CODE END INCLUDE */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/** @addtogroup STM32_USB_OTG_DEVICE_LIBRARY
  * @brief Usb device.
  * @{
  */

/** @addtogroup USBD_CUSTOM_HID
  * @{
  */

/** @defgroup USBD_CUSTOM_HID_Private_TypesDefinitions USBD_CUSTOM_HID_Private_TypesDefinitions
  * @brief Private types.
  * @{
  */

/* USER CODE BEGIN PRIVATE_TYPES */

/* USER CODE END PRIVATE_TYPES */

/**
  * @}
  */

/** @defgroup USBD_CUSTOM_HID_Private_Defines USBD_CUSTOM_HID_Private_Defines
  * @brief Private defines.
  * @{
  */

/* USER CODE BEGIN PRIVATE_DEFINES */

/* USER CODE END PRIVATE_DEFINES */

/**
  * @}
  */

/** @defgroup USBD_CUSTOM_HID_Private_Macros USBD_CUSTOM_HID_Private_Macros
  * @brief Private macros.
  * @{
  */

/* USER CODE BEGIN PRIVATE_MACRO */

/* USER CODE END PRIVATE_MACRO */

/**
  * @}
  */

/** @defgroup USBD_CUSTOM_HID_Private_Variables USBD_CUSTOM_HID_Private_Variables
  * @brief Private variables.
  * @{
  */

/** Usb HID report descriptor. */
__ALIGN_BEGIN static uint8_t CUSTOM_HID_ReportDesc_FS[USBD_CUSTOM_HID_REPORT_DESC_SIZE] __ALIGN_END =
{
  /* USER CODE BEGIN 0 */
//		0x06, 0x00, 0xFF,        // USAGE_PAGE (Vendor Defined Page 1)
//		0x09, 0x01,              // USAGE (Vendor Usage 1)
//		0xA1, 0x01,              // COLLECTION (Application)
//
//		// Report ID 1: Input report (receiving 256-bit data)
//		0x09, 0x01,              // USAGE (Vendor Usage 1)
//		0x15, 0x00,              //   LOGICAL_MINIMUM (0)
//		0x26, 0xFF, 0x00,        //   LOGICAL_MAXIMUM (1023 -> 0x3FF) (256 * 4 - 1)
//		0x75, 0x08,              //   REPORT_SIZE (8 bits)
//		0x95, 0x20,              //   REPORT_COUNT (32 fields, 256 bits / 8 bits per field)
//		0x81, 0x00,              //   INPUT (Data,Var,Abs)
//
//		// Report ID 2: Output report (sending 256-bit data)
//		0x09, 0x02,              // USAGE (Vendor Usage 2)
//		0x15, 0x00,              //   LOGICAL_MINIMUM (0)
//		0x26, 0xFF, 0x00,        //   LOGICAL_MAXIMUM (1023 -> 0x3FF) (256 * 4 - 1)
//		0x75, 0x08,              //   REPORT_SIZE (8 bits)
//		0x95, 0x20,              //   REPORT_COUNT (32 fields, 256 bits / 8 bits per field)
//		0x91, 0x00,              //   OUTPUT (Data,Var,Abs)
//
//		// Report ID 3: Feature report (sending single bit command)
//		0x09, 0x02,              // USAGE (Vendor Usage 3)
//		0x15, 0x00,              //   LOGICAL_MINIMUM (0)
//		0x25, 0x01,              //   LOGICAL_MAXIMUM (1)
//		0x75, 0x01,              //   REPORT_SIZE (1 bit)
//		0x95, 0x01,              //   REPORT_COUNT (1 field)
//		0x91, 0x00,              //   OUTPUT (Data,Var,Abs)
//
//		// Report ID 4: Input report for receiving 30 characters
//		0x09, 0x02,              // USAGE (Vendor Usage 4)
//		0x15, 0x00,              //   LOGICAL_MINIMUM (0)
//		0x26, 0xFF, 0x00,        //   LOGICAL_MAXIMUM (255)
//		0x75, 0x08,              //   REPORT_SIZE (8 bits)
//		0x95, 0x1E,              //   REPORT_COUNT (30 fields, 30 characters)
//		0x81, 0x00,              //   INPUT (Data,Var,Abs)
//
//		// Report ID 5: Output report for sending 30 characters to device
//		0x09, 0x02,              // USAGE (Vendor Usage 5)
//		0x15, 0x00,              //   LOGICAL_MINIMUM (0)
//		0x26, 0xFF, 0x00,        //   LOGICAL_MAXIMUM (255)
//		0x75, 0x08,              //   REPORT_SIZE (8 bits)
//		0x95, 0x1E,              //   REPORT_COUNT (30 fields, 30 characters)
//		0x91, 0x00,              //   OUTPUT (Data,Var,Abs)

	    // Usage Page (Vendor Defined Page)
	    0x06, 0xFF, 0xFF,        // Usage Page (Vendor Defined Page 1)

	    // Usage (Vendor Defined Usage 1)
	    0x09, 0x01,              // Usage (Vendor Defined Usage 1)
	    0xA1, 0x01,              // Collection (Application)

	    // Report ID 1: Status Check Command (1 byte, byte-aligned)
		0x85, 0x01,				 // report ID 1
	    0x09, 0x01,              // Usage (Vendor Defined Usage 9)
	    0x15, 0x00,              // Logical Minimum (0)
	    0x26, 0x01, 0x00,        // Logical Maximum (255)
	    0x75, 0x08,              // Report Size (8 bits)
	    0x95, STATUS_CMD_SIZE,   // Report Count (1 byte)
	    0x81, 0x02,              // Input (Data, Variable)

		// Report ID 2: Request Fingerprint CMD (1 byte, byte-aligned)
		0x85, 0x02,				 // report ID 2
		0x09, 0x02,              // Usage (Vendor Defined Usage 7)
		0x15, 0x00,              // Logical Minimum (0)
		0x26, 0x01, 0x00,        // Logical Maximum (255)
		0x75, 0x08,              // Report Size (8 bits)
		0x95, FP_CMD_SIZE,       // Report Count (1 byte)
		0x81, 0x02,              // Input (Data, Variable)

	    // Report ID 3: Public Key IN Transfer (64 bytes, byte-aligned)
		0x85, 0x03,				 // report ID 3
	    0x09, 0x01,              // Usage (Vendor Defined Usage 1)
	    0x15, 0x00,              // Logical Minimum (0)
	    0x26, 0xFF, 0x00,        // Logical Maximum (255)
	    0x75, 0x08,              // Report Size (8 bits)
	    0x95, PUBLIC_KEY_SIZE,   // Report Count (64 bytes)
	    0x81, 0x00,              // Input (Data, Variable)

		// Report ID 4: Public Key IN Transfer (64 bytes, byte-aligned)
		0x85, 0x04,				 // report ID 4
	    0x09, 0x01,              // Usage (Vendor Defined Usage 2)
	    0x15, 0x00,              // Logical Minimum (0)
	    0x26, 0xFF, 0x00,        // Logical Maximum (255)
	    0x75, 0x08,              // Report Size (8 bits)
	    0x95, PUBLIC_KEY_SIZE,              // Report Count (64 bytes)
	    0x91, 0x00,              // Output (Data, Variable)

	    // Report ID 5: Sign Data Request (64 bytes, byte-aligned)
		0x85, 0x05,				 // report ID 5
	    0x09, 0x02,              // Usage (Vendor Defined Usage 3)
	    0x15, 0x00,              // Logical Minimum (0)
	    0x26, 0xFF, 0x00,        // Logical Maximum (255)
	    0x75, 0x08,              // Report Size (8 bits)
	    0x95, SIGNED_STRING_SIZE,// Report Count (64 bytes)
	    0x81, 0x00,              // Input (Data, Variable)

		// Report ID 6: Sign Data Request (64 bytes, byte-aligned)
		0x85, 0x06,				 // report ID 6
	    0x09, 0x01,              // Usage (Vendor Defined Usage 4)
	    0x15, 0x00,              // Logical Minimum (0)
	    0x26, 0xFF, 0x00,        // Logical Maximum (255)
	    0x75, 0x08,              // Report Size (8 bits)
	    0x95, SIGNED_STRING_SIZE,// Report Count (64 bytes)
	    0x91, 0x00,              // Output (Data, Variable)

  /* USER CODE END 0 */
  0xC0    /*     END_COLLECTION	             */
};

/* USER CODE BEGIN PRIVATE_VARIABLES */

/* USER CODE END PRIVATE_VARIABLES */

/**
  * @}
  */

/** @defgroup USBD_CUSTOM_HID_Exported_Variables USBD_CUSTOM_HID_Exported_Variables
  * @brief Public variables.
  * @{
  */
extern USBD_HandleTypeDef hUsbDeviceFS;

/* USER CODE BEGIN EXPORTED_VARIABLES */

/* USER CODE END EXPORTED_VARIABLES */
/**
  * @}
  */

/** @defgroup USBD_CUSTOM_HID_Private_FunctionPrototypes USBD_CUSTOM_HID_Private_FunctionPrototypes
  * @brief Private functions declaration.
  * @{
  */

static int8_t CUSTOM_HID_Init_FS(void);
static int8_t CUSTOM_HID_DeInit_FS(void);
static int8_t CUSTOM_HID_OutEvent_FS(uint8_t event_idx, uint8_t state);

/**
  * @}
  */

USBD_CUSTOM_HID_ItfTypeDef USBD_CustomHID_fops_FS =
{
  CUSTOM_HID_ReportDesc_FS,
  CUSTOM_HID_Init_FS,
  CUSTOM_HID_DeInit_FS,
  CUSTOM_HID_OutEvent_FS
};

/** @defgroup USBD_CUSTOM_HID_Private_Functions USBD_CUSTOM_HID_Private_Functions
  * @brief Private functions.
  * @{
  */

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Initializes the CUSTOM HID media low layer
  * @retval USBD_OK if all operations are OK else USBD_FAIL
  */
static int8_t CUSTOM_HID_Init_FS(void)
{
  /* USER CODE BEGIN 4 */
  return (USBD_OK);
  /* USER CODE END 4 */
}

/**
  * @brief  DeInitializes the CUSTOM HID media low layer
  * @retval USBD_OK if all operations are OK else USBD_FAIL
  */
static int8_t CUSTOM_HID_DeInit_FS(void)
{
  /* USER CODE BEGIN 5 */
  return (USBD_OK);
  /* USER CODE END 5 */
}

/**
  * @brief  Manage the CUSTOM HID class events
  * @param  event_idx: Event index
  * @param  state: Event state
  * @retval USBD_OK if all operations are OK else USBD_FAIL
  */
static int8_t CUSTOM_HID_OutEvent_FS(uint8_t event_idx, uint8_t state)
{
  /* USER CODE BEGIN 6 */
  UNUSED(event_idx);
  UNUSED(state);

  /* Start next USB packet transfer once data processing is completed */
  if (USBD_CUSTOM_HID_ReceivePacket(&hUsbDeviceFS) != (uint8_t)USBD_OK)
  {
    return -1;
  }

  return (USBD_OK);
  /* USER CODE END 6 */
}

/* USER CODE BEGIN 7 */
/**
  * @brief  Send the report to the Host
  * @param  report: The report to be sent
  * @param  len: The report length
  * @retval USBD_OK if all operations are OK else USBD_FAIL
  */
static int8_t USBD_CUSTOM_HID_SendReport_FS(uint8_t *report, uint16_t len)
{
  return USBD_CUSTOM_HID_SendReport(&hUsbDeviceFS, report, len);
}


/* USER CODE END 7 */

/* USER CODE BEGIN PRIVATE_FUNCTIONS_IMPLEMENTATION */
int8_t send_report(uint8_t* report, uint16_t len)
{
	return USBD_CUSTOM_HID_SendReport_FS(report, len);
}
/* USER CODE END PRIVATE_FUNCTIONS_IMPLEMENTATION */
/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

