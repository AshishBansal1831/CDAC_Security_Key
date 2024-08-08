#include "fingerprint_module.h"

// UART handles for fingerprint and TTL modules
extern UART_HandleTypeDef huart4;
extern UART_HandleTypeDef huart5;

void send_command(UART_HandleTypeDef *huart, packet *pkt) {
    pkt->start_byte = 0xF5;
    pkt->end_byte = 0xF5;
    pkt->checksum = calculate_checksum(pkt);
    HAL_UART_Transmit(huart, (uint8_t *)pkt, sizeof(packet), HAL_MAX_DELAY);
}

uint8_t calculate_checksum(packet *pkt) {
    uint8_t sum = pkt->command;
    for (int i = 0; i < 4; i++) {
        sum += pkt->parameter[i];
    }
    return sum;
}

void Open_Fingerprint_Module(void) {
    packet pkt = { .command = CMD_OPEN };
    send_command(&huart5, &pkt);
}

void Close_Fingerprint_Module(void) {
    packet pkt = { .command = CMD_CLOSE };
    send_command(&huart5, &pkt);
}

void LED_Control_Fingerprint_Module(uint8_t state) {
    packet pkt = { .command = CMD_LED_CONTROL, .parameter = {state} };
    send_command(&huart5, &pkt);
}

uint8_t Is_Finger_Pressed(void) {
    packet pkt = { .command = CMD_IS_PRESS_FINGER };
    send_command(&huart5, &pkt);
    
    uint8_t response;
    HAL_UART_Receive(&huart5, &response, 1, HAL_MAX_DELAY);
    return response;
}

void Enroll_Fingerprint(uint8_t ID) {
    packet pkt = { .command = CMD_ENROLL, .parameter = {ID} };
    send_command(&huart5, &pkt);
}

void Delete_Fingerprint_ID(uint8_t ID) {
    packet pkt = { .command = CMD_DELETE_ID, .parameter = {ID} };
    send_command(&huart5, &pkt);
}

void Delete_All_Fingerprints(void) {
    packet pkt = { .command = CMD_DELETE_ALL };
    send_command(&huart5, &pkt);
}

uint8_t Get_User_Count(void) {
    packet pkt = { .command = CMD_GET_USER_COUNT };
    send_command(&huart5, &pkt);
    
    uint8_t user_count;
    HAL_UART_Receive(&huart5, &user_count, 1, HAL_MAX_DELAY);
    return user_count;
}

uint8_t Identify_Fingerprint(void) {
    packet pkt = { .command = CMD_IDENTIFY };
    send_command(&huart5, &pkt);
    
    uint8_t user_id;
    HAL_UART_Receive(&huart5, &user_id, 1, HAL_MAX_DELAY);
    return user_id;
}

uint8_t Get_Entry_ID(void) {
    packet pkt = { .command = CMD_GET_ENTRY_ID };
    send_command(&huart5, &pkt);
    
    uint8_t entry_id;
    HAL_UART_Receive(&huart5, &entry_id, 1, HAL_MAX_DELAY);
    return entry_id;
}

void Enroll_Cancel(void) {
    packet pkt = { .command = CMD_ENROLL_CANCEL };
    send_command(&huart5, &pkt);
}