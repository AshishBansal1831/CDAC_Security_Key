#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define PUBLIC_KEY_SIZE     62
#define SIGNED_STRING_SIZE  62

typedef enum{
    DEVICE_KEY,
    HOST_KEY
}PUB_KEY;

void generateKeys();
void encrypt(char *org_string, PUB_KEY);
void decrypt(char *org_string);

extern int8_t Device_PublicKey[PUBLIC_KEY_SIZE];
extern int8_t public_key[PUBLIC_KEY_SIZE];

