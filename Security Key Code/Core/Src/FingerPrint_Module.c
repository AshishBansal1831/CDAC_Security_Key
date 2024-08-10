#include "FingerPrint_Module.h"

// UART handles for fingerprint and TTL modules
extern UART_HandleTypeDef huart4;
extern UART_HandleTypeDef huart5;

#define FINGERPRINT_UART &huart5

static void send_command(Packet pkt)
{
	pkt.start_byte = pkt.end_byte = 0xF5;
    pkt.checksum = calculate_checksum(pkt);
    HAL_UART_Transmit(FINGERPRINT_UART, (uint8_t*)&pkt, sizeof(Packet), 2000);
}

static Packet RecevieAck()
{
	Packet receive = {.command = 0};
	HAL_UART_Receive(FINGERPRINT_UART, (uint8_t*)&receive , sizeof(receive), 2000);
	return receive;
}

uint8_t calculate_checksum(Packet pkt)
{
    uint16_t checksum = pkt.command;
    for (int i = 0; i < 4; i++)
    {
        checksum ^= pkt.parameter[i]; // CheckSum is calculated using XOR
    }
    return (uint8_t)checksum;
}

void Open_Fingerprint_Module(void)
{
    Packet open_cmd = {.command = OPEN, .parameter = {0}};
    send_command(open_cmd);
}

void Close_Fingerprint_Module(void)
{
    Packet close_cmd = {.command =CLOSE, .parameter = {0}};
    send_command(close_cmd);
}

void LED_Control_Fingerprint_Module(uint8_t state)
{
    Packet led_cmd = {.command = LED_CONTROL, .parameter = {state}, 0, 0xF5};
    send_command(led_cmd);
}

uint8_t Is_Finger_Pressed(void)
{
    Packet is_press_cmd = {.command = IS_FINGER_PRESS, .parameter = {0}};
    send_command(is_press_cmd);

    Packet response = RecevieAck();
    return response.parameter[1];
}

void Enroll_Fingerprint(uint8_t ID)
{
    Packet enroll_cmd = {.command = ENROLL, .parameter = {ID}};
    send_command(enroll_cmd);
    Packet receive;

    do
    {
    	receive = RecevieAck();
    }while(receive.parameter[1] !=0x03); // receive the Acknowledgement

}

void Delete_Fingerprint_ID(uint8_t ID)
{
    Packet delete_cmd = {.command = DELETE_ID, .parameter = {ID}};
    send_command(delete_cmd);
}

void Delete_All_Fingerprints(void)
{
    Packet delete_all_cmd = {.command =DELETE_ALL, .parameter = {0}};
    send_command(delete_all_cmd);
}

uint8_t Get_User_Count(void)
{
    Packet user_count_cmd = {.command =GET_USER_COUNT, .parameter = {0}};
    send_command(user_count_cmd);

    Packet response = RecevieAck();
	return response.parameter[1];
}

uint8_t Identify_Fingerprint(void)
{
	uint8_t counter = 0;

	// wait for the finger to be pressed
	while(counter++ < 200 && Is_Finger_Pressed() == 0);

	if(counter > 200)
	{
		return 0;
	}

    Packet identify_cmd = {.command =IDENTIFY, .parameter = {0}};
    send_command(identify_cmd);

    Packet response = RecevieAck();
	return response.parameter[1];
}

uint8_t Get_EntryID(void)
{
    Packet get_entry_id_cmd = {.command =GET_ENTRY_ID, .parameter = {0}};
    send_command(get_entry_id_cmd);

    Packet response = RecevieAck();
	return response.parameter[1];
}

void Enroll_Cancel(void)
{
    Packet enroll_cancel_cmd = {.command =ENROLL_CANCEL, .parameter = {0}};
    enroll_cancel_cmd.checksum = calculate_checksum(enroll_cancel_cmd); // Ensure the checksum is correctly calculated
    send_command(enroll_cancel_cmd);
}
