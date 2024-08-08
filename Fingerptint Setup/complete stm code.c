/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
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
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stm32f4xx_hal.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart4;
UART_HandleTypeDef huart5;

/* USER CODE BEGIN PV */
typedef enum {
    success = 0x00,
    fail = 0x01,
    full = 0x04,
    NOUSER = 0x05,
    USER_EXIST = 0x07,
    TIMEOUT = 0x08,
    WRONG_FORMAT = 0x09,
    BREAK = 0x18,
    INVALID_PARAMETER = 0xB0,
    FINGER_IS_NOT_PRESSED = 0xB1,
    COMMAND_NO_SUPPORT = 0xB4,
    ENROLL_OVEREXPOSURE = 0xB5,
    ENROLL_DUPLICATE = 0xB8,
    FINGER_PRESS_NOT_FULL = 0xB9,
    ENROLL_POOR_QUALITY = 0xBA,
} ack;

typedef enum {
    Open = 0xA0,
    Close = 0xA1,
    LED_Control = 0xB4,
    Is_Press_Finger = 0xB5,
    Enroll = 0x01,
    Delete_ID = 0x04,
    Delete_All = 0x05,
    Get_User_Count = 0x09,
    Identify = 0x0C,
    Get_Entry_ID = 0x0D,
	ENROLL_CANCEL = 0x92,
} cmd;

typedef struct {
    uint8_t start_byte;
    cmd command;
    uint8_t parameter[4];
    uint8_t checksum;
    uint8_t end_byte;
} packet;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_UART4_Init(void);
static void MX_UART5_Init(void);
/* USER CODE BEGIN PFP */
void send_command(UART_HandleTypeDef *huart, packet *pkt);
uint8_t calculate_checksum(packet *pkt);
void Open_Fingerprint_Module(void);
void Close_Fingerprint_Module(void);
void LED_Control_Fingerprint_Module(uint8_t state);
uint8_t Is_Finger_Pressed(void);
void Enroll_Fingerprint(uint8_t ID);
void Delete_Fingerprint_ID(uint8_t ID);
void Delete_All_Fingerprints(void);
uint8_t Get_User_Counted(void);
uint8_t Identify_Fingerprint(void);
uint8_t Get_EntryID(void);
void Enroll_Cancel(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_UART4_Init();
  MX_UART5_Init();
  /* USER CODE BEGIN 2 */
  Open_Fingerprint_Module();
  HAL_Delay(1000);
  uint8_t finger_status = Is_Finger_Pressed();
  HAL_UART_Transmit(&huart4, &finger_status, 1, 2000);
  /* USER CODE END 2 */
  Open_Fingerprint_Module();
  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief UART4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_UART4_Init(void)
{

  /* USER CODE BEGIN UART4_Init 0 */

  /* USER CODE END UART4_Init 0 */

  /* USER CODE BEGIN UART4_Init 1 */

  /* USER CODE END UART4_Init 1 */
  huart4.Instance = UART4;
  huart4.Init.BaudRate = 115200;
  huart4.Init.WordLength = UART_WORDLENGTH_8B;
  huart4.Init.StopBits = UART_STOPBITS_1;
  huart4.Init.Parity = UART_PARITY_NONE;
  huart4.Init.Mode = UART_MODE_TX_RX;
  huart4.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart4.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart4) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN UART4_Init 2 */

  /* USER CODE END UART4_Init 2 */

}

/**
  * @brief UART5 Initialization Function
  * @param None
  * @retval None
  */
static void MX_UART5_Init(void)
{

  /* USER CODE BEGIN UART5_Init 0 */

  /* USER CODE END UART5_Init 0 */

  /* USER CODE BEGIN UART5_Init 1 */

  /* USER CODE END UART5_Init 1 */
  huart5.Instance = UART5;
  huart5.Init.BaudRate = 115200;
  huart5.Init.WordLength = UART_WORDLENGTH_8B;
  huart5.Init.StopBits = UART_STOPBITS_1;
  huart5.Init.Parity = UART_PARITY_NONE;
  huart5.Init.Mode = UART_MODE_TX_RX;
  huart5.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart5.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart5) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN UART5_Init 2 */

  /* USER CODE END UART5_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOD, GPIO_PIN_12, GPIO_PIN_RESET);

  /*Configure GPIO pin : PD12 */
  GPIO_InitStruct.Pin = GPIO_PIN_12;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void send_command(UART_HandleTypeDef *huart, packet *pkt) {
    pkt->checksum = calculate_checksum(pkt);
    HAL_UART_Transmit(huart, (uint8_t*)pkt, sizeof(packet), HAL_MAX_DELAY);
}

uint8_t calculate_checksum(packet *pkt) {
    uint16_t sum = pkt->command;
    for (int i = 0; i < 4; i++) {
        sum += pkt->parameter[i];
    }
    return (uint8_t)sum;
}

void Open_Fingerprint_Module(void) {
    packet open_cmd = {0xF5, Open, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &open_cmd);
}

void Close_Fingerprint_Module(void) {
    packet close_cmd = {0xF5, Close, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &close_cmd);
}

void LED_Control_Fingerprint_Module(uint8_t state) {
    packet led_cmd = {0xF5, LED_Control, {state, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &led_cmd);
}

uint8_t Is_Finger_Pressed(void) {
    packet is_press_cmd = {0xF5, Is_Press_Finger, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &is_press_cmd);
    uint8_t response[8];
    HAL_UART_Receive(&huart5, response, 8, HAL_MAX_DELAY);
    return response[4];
}

void Enroll_Fingerprint(uint8_t ID) {
    packet enroll_cmd = {0xF5, Enroll, {ID, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &enroll_cmd);
}

void Delete_Fingerprint_ID(uint8_t ID) {
    packet delete_cmd = {0xF5, Delete_ID, {ID, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &delete_cmd);
}

void Delete_All_Fingerprints(void) {
    packet delete_all_cmd = {0xF5, Delete_All, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &delete_all_cmd);
}

uint8_t Get_User_Counted(void) {
    packet user_count_cmd = {0xF5, Get_User_Count, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &user_count_cmd);
    uint8_t response[8];
    HAL_UART_Receive(&huart5, response, 8, HAL_MAX_DELAY);
    return response[4];
}

uint8_t Identify_Fingerprint(void) {
    packet identify_cmd = {0xF5, Identify, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &identify_cmd);
    uint8_t response[8];
    HAL_UART_Receive(&huart5, response, 8, HAL_MAX_DELAY);
    return response[4];
}

uint8_t Get_EntryID(void) {
    packet get_entry_id_cmd = {0xF5, Get_Entry_ID, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &get_entry_id_cmd);
    uint8_t response[8];
    HAL_UART_Receive(&huart5, response, 8, HAL_MAX_DELAY);
    return response[4];
}

void Enroll_Cancel(void) {
    packet enroll_cancel_cmd = {0xF5, ENROLL_CANCEL, {0, 0, 0, 0}, 0, 0xF5};
    enroll_cancel_cmd.checksum = calculate_checksum(&enroll_cancel_cmd); // Ensure the checksum is correctly calculated
    send_command(&huart5, &enroll_cancel_cmd);
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
