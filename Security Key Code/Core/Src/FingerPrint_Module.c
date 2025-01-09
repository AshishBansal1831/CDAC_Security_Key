#include "FingerPrint_Module.h"
#include "usb_operations.h"
#include "stdio.h"
#include <string.h>

// UART handles for fingerprint and TTL modules
extern UART_HandleTypeDef huart4;
extern UART_HandleTypeDef huart5;

extern uint8_t data;
extern USB_OPERATIONS operation;

uint8_t receive_buff[sizeof(Packet)];
uint8_t receive_flag = 0;

static UART_HandleTypeDef* FINGERPRINT_UART = &huart4;

static void send_command(Packet pkt)
{
	pkt.start_byte = FP_START_BYTE;
	pkt.end_byte   = FP_END_BYTE;
    pkt.checksum   = calculate_checksum(pkt);
    printf("Send data = %d\r\n", pkt.parameter[0]);
    HAL_UART_Transmit(FINGERPRINT_UART, (uint8_t*)&pkt, sizeof(pkt), HAL_MAX_DELAY);
}

static Packet RecevieAck()
{
	Packet receive;
	uint8_t i=0;
	printf("In Receive %d\r\n", receive_flag);
	while(i<20 && receive_flag!=sizeof(Packet))
	{
		receive_flag = 0;
		printf("Waiting %d %x\r\n", receive_flag, data);
//		HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_15);
		HAL_Delay(100);
		i++;
	}

	receive = *(Packet*)receive_buff;

	printf("Received = %x %x ", receive.start_byte, receive.command);
	for(uint8_t i=0; i < FP_DATA_SIZE;  ++i)
	{
		printf("%x ", receive.parameter[i]);
	}
	printf("%x %x\r\n", receive.checksum, receive.end_byte);

	memset(receive_buff, 0, sizeof(receive_buff));

	return receive;
}

uint8_t calculate_checksum(Packet pkt)
{
    uint8_t checksum =pkt.command;
    for (uint8_t i = 0; i < FP_DATA_SIZE; i++)
    {
        checksum = pkt.parameter[i] ^ checksum; // CheckSum is calculated using XOR
    }
    return checksum;
}

void Open_Fingerprint_Module(void)
{
    Packet open_cmd = {.command = OPEN, .parameter = {0}};
    send_command(open_cmd);
}

void Close_Fingerprint_Module(void)
{
    Packet close_cmd = {.command = CLOSE, .parameter = {0}};
    send_command(close_cmd);
}

void LED_Control_Fingerprint_Module(uint8_t state)
{
    Packet led_cmd = {.command = LED_CONTROL, .parameter = {state}, 0, FP_START_BYTE};
    send_command(led_cmd);
}

uint8_t Is_Finger_Pressed(void)
{
    Packet is_press_cmd = {.command = IS_FINGER_PRESS, .parameter = {0}};
    send_command(is_press_cmd);

    Packet response = RecevieAck();
    return response.parameter[0];
}

uint8_t Enroll_Fingerprint(uint8_t ID)
{
	printf("Enrol FingerPrint\r\n");
    Packet enroll_cmd = {.command = ENROLL, .parameter = {0, ID}};
    send_command(enroll_cmd);

    HAL_Delay(1000);

    Packet receive;
    receive = RecevieAck();

    return receive.parameter[0];

}

void Delete_Fingerprint_ID(uint8_t ID)
{
    Packet delete_cmd = {.command = DELETE_ID, .parameter = {ID}};
    send_command(delete_cmd);
}

void Delete_All_Fingerprints(void)
{
    Packet delete_all_cmd = {.command = DELETE_ALL, .parameter = {0}};
    send_command(delete_all_cmd);

    RecevieAck();
}

uint8_t Get_User_Count(void)
{
    Packet user_count_cmd = {.command = GET_USER_COUNT, .parameter = {0}};
    send_command(user_count_cmd);

    Packet response = RecevieAck();
	return response.parameter[1];
}

uint8_t Identify_Fingerprint(void)
{
	uint16_t counter = 0;

	// wait for the finger to be pressed
	while(++counter<300 && Is_Finger_Pressed() == 0);

	// if finger was not pressed before timeout
	if(counter > 300)
	{
		return 0;
	}

	Is_Finger_Pressed();

    Packet identify_cmd = {.command = IDENTIFY, .parameter = {0}};
    send_command(identify_cmd);

    Packet response = RecevieAck();
    operation = NO_ACTION;
	return response.parameter[1];
}

uint8_t Get_EntryID(void)
{
    Packet get_entry_id_cmd = {.command = GET_ENTRY_ID, .parameter = {0}};
    send_command(get_entry_id_cmd);
    HAL_Delay(1000);
    Packet response = RecevieAck();
    printf("Return %x %x\r\n", response.parameter[0], response.parameter[1]);
	return response.parameter[1];
}

void Enroll_Cancel(void)
{
    Packet enroll_cancel_cmd = {.command = ENROLL_CANCEL, .parameter = {0}};
    enroll_cancel_cmd.checksum = calculate_checksum(enroll_cancel_cmd); // Ensure the checksum is correctly calculated
    send_command(enroll_cancel_cmd);
}
