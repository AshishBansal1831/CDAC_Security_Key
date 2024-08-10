#include "fingerprint_module.h"

// UART handles for fingerprint and TTL modules
extern UART_HandleTypeDef huart4;
extern UART_HandleTypeDef huart5;

void send_command(UART_HandleTypeDef *huart, packet *pkt) {
    pkt->checksum = calculate_checksum(pkt);
    HAL_UART_Transmit(huart, (uint8_t*)pkt, sizeof(packet), 2000);
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
    HAL_UART_Receive(&huart5, response, 8, 2000);
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
    HAL_UART_Receive(&huart5, response, 8, 2000);
    return response[4];
}

uint8_t Get_EntryID(void) {
    packet get_entry_id_cmd = {0xF5, Get_Entry_ID, {0, 0, 0, 0}, 0, 0xF5};
    send_command(&huart5, &get_entry_id_cmd);
    uint8_t response[8];
    HAL_UART_Receive(&huart5, response, 8, 2000);
    return response[4];
}

void Enroll_Cancel(void) {
    packet enroll_cancel_cmd = {0xF5, ENROLL_CANCEL, {0, 0, 0, 0}, 0, 0xF5};
    enroll_cancel_cmd.checksum = calculate_checksum(&enroll_cancel_cmd); // Ensure the checksum is correctly calculated
    send_command(&huart5, &enroll_cancel_cmd);
}
